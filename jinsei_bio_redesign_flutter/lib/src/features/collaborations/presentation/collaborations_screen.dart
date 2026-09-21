import 'package:flutter/material.dart';
import '../../../core/widgets/coming_soon_view.dart';

class CollaborationsScreen extends StatelessWidget {
  const CollaborationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonView(
      title: 'Global Collaborations',
      subtitle:
          'Strategic partnerships with NCL Innovation Park, global research institutions, and biopharma innovators.',
      icon: Icons.handshake_rounded,
      categoryTag: 'Strategic Partnerships & Alliances',
    );
  }
}
