import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/repositories/home_repository_impl.dart';

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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomeRepositoryImpl Tests', () {
    test('getHomeContent returns content from local data source', () async {
      final localDataSource = HomeLocalDataSource(bundle: TestAssetBundle());
      final repository = HomeRepositoryImpl(localDataSource: localDataSource);

      final content = await repository.getHomeContent();
      expect(content.pillars.length, equals(8));
      expect(content.executiveStats.length, equals(3));
      expect(content.productVerticals.length, equals(3));
    });
  });
}
