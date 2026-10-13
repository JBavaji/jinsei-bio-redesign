import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/bloc/solutions_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/widgets/vertical_tab_selector.dart';

void main() {
  Widget buildSelector({required SolutionsBloc bloc, ThemeData? theme}) {
    return MaterialApp(
      theme: theme ?? AppTheme.darkTheme,
      home: Scaffold(
        body: BlocProvider.value(
          value: bloc,
          child: const VerticalTabSelector(),
        ),
      ),
    );
  }

  group('VerticalTabSelector Widget Tests (JIN-18)', () {
    testWidgets('renders all 5 category filter chips', (tester) async {
      final bloc = SolutionsBloc();
      await tester.pumpWidget(buildSelector(bloc: bloc));

      expect(find.text('All Verticals (4)'), findsOneWidget);
      expect(find.text('Human Health'), findsOneWidget);
      expect(find.text('Food Tech'), findsOneWidget);
      expect(find.text('Dermo-Biotics'), findsOneWidget);
      expect(find.text('Agri-Tech'), findsOneWidget);

      bloc.close();
    });

    testWidgets('tapping a category chip dispatches filter event to bloc',
        (tester) async {
      final bloc = SolutionsBloc();
      await tester.pumpWidget(buildSelector(bloc: bloc));

      expect(bloc.state.selectedCategory, equals(SolutionCategory.all));

      await tester.tap(find.text('Dermo-Biotics'));
      await tester.pumpAndSettle();

      expect(
          bloc.state.selectedCategory, equals(SolutionCategory.dermoBiotics));

      bloc.close();
    });
  });
}
