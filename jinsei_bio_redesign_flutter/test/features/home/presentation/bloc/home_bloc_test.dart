import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/home_event.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/home_state.dart';

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

  group('HomeBloc Tests', () {
    late HomeBloc bloc;

    setUp(() {
      final localDataSource = HomeLocalDataSource(bundle: TestAssetBundle());
      final repository = HomeRepositoryImpl(localDataSource: localDataSource);
      bloc = HomeBloc(repository: repository);
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state has isIdle true', () {
      expect(bloc.state.isIdle, isTrue);
      expect(bloc.state.pillars, isEmpty);
      expect(bloc.state.executiveStats, isEmpty);
      expect(bloc.state.productVerticals, isEmpty);
    });

    test('LoadHomeContentEvent populates pillars, stats, and verticals',
        () async {
      bloc.add(const LoadHomeContentEvent());
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const HomeState(status: HomeStatus.loading),
          isA<HomeState>()
              .having((s) => s.isSuccess, 'isSuccess', isTrue)
              .having((s) => s.pillars.length, 'pillars length', 8)
              .having((s) => s.executiveStats.length, 'stats length', 3)
              .having((s) => s.productVerticals.length, 'verticals length', 3),
        ]),
      );
    });
  });
}
