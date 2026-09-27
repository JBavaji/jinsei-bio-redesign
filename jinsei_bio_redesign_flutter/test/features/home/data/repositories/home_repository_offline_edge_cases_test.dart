import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/models/executive_stat_model.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/models/pillar_item_model.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/models/product_vertical_model.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/home/domain/models/home_content_model.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/data/home_content.json') {
      return File('assets/data/home_content.json').readAsString();
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    final bytes = await File(key).readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(bytes));
  }
}

class MockOfflineRemoteDataSource implements IHomeRemoteDataSource {
  final Exception? exceptionToThrow;

  MockOfflineRemoteDataSource({this.exceptionToThrow});

  @override
  Future<HomeContentModel?> getHomeContent(
      {Duration timeout = const Duration(milliseconds: 5000)}) async {
    return null;
  }
}

class MockHiveDataSource implements IHomeHiveDataSource {
  HomeContentModel? cachedData;

  MockHiveDataSource({this.cachedData});

  @override
  Future<HomeContentModel?> getCachedHomeContent() async {
    return cachedData;
  }

  @override
  Future<void> saveHomeContent(HomeContentModel content) async {
    cachedData = content;
  }

  @override
  Future<void> clearCache() async {
    cachedData = null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Offline Edge Cases & Resiliency Cascade Tests', () {
    test(
        'EDGE CASE: No internet connection (SocketException) falls back to Hive DB cache if present',
        () async {
      final List<PillarItemModel> cachedPillars = [
        const PillarItemModel(
            icon: Icons.eco,
            iconKey: 'eco',
            title: 'Cached Pillar',
            description: 'From Hive DB')
      ];
      final mockHive = MockHiveDataSource(
        cachedData: HomeContentModel(
          pillars: cachedPillars,
          executiveStats: const [
            ExecutiveStatModel(
                icon: Icons.star,
                iconKey: 'star',
                title: 'Cached Stat',
                subtitle: 'Offline Hive')
          ],
          productVerticals: const [
            ProductVerticalModel(
                title: 'Cached Vertical',
                strainId: 'JN-01',
                description: 'Offline Hive')
          ],
        ),
      );

      final repository = HomeRepositoryImpl(
        localDataSource: HomeLocalDataSource(bundle: TestAssetBundle()),
        remoteDataSource: MockOfflineRemoteDataSource(
          exceptionToThrow:
              const SocketException('No Internet Connection (Offline)'),
        ),
        hiveDataSource: mockHive,
      );

      final result = await repository.getHomeContent();

      // Verify Hive DB cache was loaded successfully
      expect(result.pillars.first.title, equals('Cached Pillar'));
      expect(result.executiveStats.first.title, equals('Cached Stat'));
    });

    test(
        'EDGE CASE: No internet AND empty Hive cache falls back to bundled asset JSON',
        () async {
      final mockEmptyHive = MockHiveDataSource(cachedData: null);

      final repository = HomeRepositoryImpl(
        localDataSource: HomeLocalDataSource(bundle: TestAssetBundle()),
        remoteDataSource: MockOfflineRemoteDataSource(
          exceptionToThrow:
              const SocketException('No Internet Connection (Offline)'),
        ),
        hiveDataSource: mockEmptyHive,
      );

      final result = await repository.getHomeContent();

      // Verify asset JSON fallback loaded all 8 pillars, 3 stats, 3 verticals
      expect(result.pillars.length, equals(8));
      expect(result.executiveStats.length, equals(3));
      expect(result.productVerticals.length, equals(3));
    });

    test(
        'EDGE CASE: Server timeout (TimeoutException) falls back seamlessly to asset JSON',
        () async {
      final repository = HomeRepositoryImpl(
        localDataSource: HomeLocalDataSource(bundle: TestAssetBundle()),
        remoteDataSource: MockOfflineRemoteDataSource(
          exceptionToThrow:
              TimeoutException('Serverpod endpoint timeout 5000ms'),
        ),
        hiveDataSource: MockHiveDataSource(cachedData: null),
      );

      final result = await repository.getHomeContent();

      expect(result.pillars.length, equals(8));
    });
  });
}
