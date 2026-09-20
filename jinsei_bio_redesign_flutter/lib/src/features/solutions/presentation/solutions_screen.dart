import 'package:flutter/material.dart';
import '../../../core/widgets/coming_soon_view.dart';

class SolutionsScreen extends StatelessWidget {
  const SolutionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonView(
      title: 'Commercial Solutions',
      subtitle:
          'B2B Live Biotherapeutic Formulations, Agritech Microbial Consortia, and Industrial Enzymatic Verticals.',
      icon: Icons.hub_rounded,
      categoryTag: 'Commercial Enterprise Solutions',
    );
  }
}
