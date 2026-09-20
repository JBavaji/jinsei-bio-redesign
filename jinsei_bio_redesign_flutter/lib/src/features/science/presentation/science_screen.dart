import 'package:flutter/material.dart';
import '../../../core/widgets/coming_soon_view.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonView(
      title: 'Science & Technology',
      subtitle:
          'Our metagenomic sequencing engine, anaerobic consortia protocols, and WGS bio-analytics platform are currently being prepared.',
      icon: Icons.biotech_rounded,
      categoryTag: 'Metagenomic Research Platform',
    );
  }
}
