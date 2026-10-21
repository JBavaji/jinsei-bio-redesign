import 'package:flutter/material.dart';
import '../../domain/models/strain_vertical_option_model.dart';
import 'b2b_strain_card.dart';

class B2bStrainVerticalSelector extends StatelessWidget {
  final List<StrainVerticalOptionModel> strains;
  final String selectedStrainId;
  final ValueChanged<String> onSelectStrain;

  const B2bStrainVerticalSelector({
    super.key,
    required this.strains,
    required this.selectedStrainId,
    required this.onSelectStrain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. SELECT TARGET COMMERCIAL STRAIN / FORMULATION VERTICAL *',
          style: TextStyle(
            color: Color(0xFFBDC8CA),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 620;
            final columnCount = isCompact ? 2 : 4;
            final itemWidth =
                (constraints.maxWidth - ((columnCount - 1) * 10)) / columnCount;

            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: strains.map((strain) {
                final isSelected = strain.strainId == selectedStrainId;
                return SizedBox(
                  width: itemWidth,
                  child: B2bStrainCard(
                    strain: strain,
                    isSelected: isSelected,
                    onTap: () => onSelectStrain(strain.strainId),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
