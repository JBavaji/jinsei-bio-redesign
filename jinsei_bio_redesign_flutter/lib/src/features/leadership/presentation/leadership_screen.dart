import 'package:flutter/material.dart';
import '../../../core/widgets/coming_soon_view.dart';

class LeadershipScreen extends StatelessWidget {
  const LeadershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonView(
      title: 'Leadership & Advisory',
      subtitle:
          'Meet the visionary bio-engineers, executives, and scientific advisory board steering Jinsei Bioscience.',
      icon: Icons.people_rounded,
      categoryTag: 'Executive Leadership & Advisory',
    );
  }
}
