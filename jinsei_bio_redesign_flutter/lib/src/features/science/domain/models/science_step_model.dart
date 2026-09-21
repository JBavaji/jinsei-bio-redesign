import 'package:flutter/material.dart';

enum ScienceStepCategory {
  discovery,
  analytics,
  formulation,
  clinical,
  commercial,
}

class ScienceStepModel {
  final int stepNumber;
  final String title;
  final String subtitle;
  final String description;
  final ScienceStepCategory category;
  final IconData icon;
  final String metricValue;
  final String metricLabel;
  final bool isCompleted;

  const ScienceStepModel({
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.icon,
    required this.metricValue,
    required this.metricLabel,
    this.isCompleted = true,
  });

  static List<ScienceStepModel> get defaultSteps => const [
        ScienceStepModel(
          stepNumber: 1,
          title: 'Target Product Identification',
          subtitle: 'Metagenomic Biomarker Mapping',
          description:
              'Identification of gut microbiota deficiencies and strain requirements using high-throughput WGS data.',
          category: ScienceStepCategory.discovery,
          icon: Icons.search_rounded,
          metricValue: '99.4%',
          metricLabel: 'Target Precision',
        ),
        ScienceStepModel(
          stepNumber: 2,
          title: 'Metagenomic Strain Isolation',
          subtitle: 'Anaerobic Cultivation Protocol',
          description:
              'Isolation and purifying of novel indigenous human gut isolates in specialized anaerobic workstations.',
          category: ScienceStepCategory.discovery,
          icon: Icons.biotech_rounded,
          metricValue: '500+',
          metricLabel: 'Strains Isolated',
        ),
        ScienceStepModel(
          stepNumber: 3,
          title: 'WGS Bio-Analytics & Annotation',
          subtitle: 'Bioinformatics Pipeline',
          description:
              'Full genomic sequencing, functional gene annotation, antibiotic resistance profiling, and safety screening.',
          category: ScienceStepCategory.analytics,
          icon: Icons.analytics_rounded,
          metricValue: '100%',
          metricLabel: 'Sequence Coverage',
        ),
        ScienceStepModel(
          stepNumber: 4,
          title: 'Consortia Compatibility Matrix',
          subtitle: 'In-Vitro Synergistic Modeling',
          description:
              'Algorithmic selection of complementary bacterial strains to form stable, non-antagonistic live consortia.',
          category: ScienceStepCategory.formulation,
          icon: Icons.hub_rounded,
          metricValue: '10M+',
          metricLabel: 'Pairs Evaluated',
        ),
        ScienceStepModel(
          stepNumber: 5,
          title: 'Bioreactor Scale-Up Protocol',
          subtitle: 'Fermentation Optimization',
          description:
              'Optimization of high-density fermentation parameters to maximize biomass yield and cell viability.',
          category: ScienceStepCategory.formulation,
          icon: Icons.precision_manufacturing_rounded,
          metricValue: '10^11',
          metricLabel: 'CFU/g Yield',
        ),
        ScienceStepModel(
          stepNumber: 6,
          title: 'Clinical Safety Screening',
          subtitle: 'In-Vivo Toxicity Studies',
          description:
              'Rigorous pre-clinical safety, immunogenicity, and metabolite safety evaluations across validated animal models.',
          category: ScienceStepCategory.clinical,
          icon: Icons.security_rounded,
          metricValue: '0',
          metricLabel: 'Adverse Events',
        ),
        ScienceStepModel(
          stepNumber: 7,
          title: 'Efficacy Trial Validation',
          subtitle: 'Randomized Double-Blind Studies',
          description:
              'Human clinical trials assessing biological efficacy, gut colonization persistence, and symptom reduction.',
          category: ScienceStepCategory.clinical,
          icon: Icons.verified_rounded,
          metricValue: '88%',
          metricLabel: 'Efficacy Rate',
        ),
        ScienceStepModel(
          stepNumber: 8,
          title: 'Regulatory Dossier Compilation',
          subtitle: 'FDA & DCGI Compliance',
          description:
              'Filing comprehensive safety, manufacturing, and clinical dossiers for live biotherapeutic product approval.',
          category: ScienceStepCategory.clinical,
          icon: Icons.assignment_rounded,
          metricValue: '3',
          metricLabel: 'Patents Filed',
        ),
        ScienceStepModel(
          stepNumber: 9,
          title: 'Industrial Batch Manufacturing',
          subtitle: 'cGMP Freeze-Drying Facility',
          description:
              'Lyophilization and protective micro-encapsulation under cGMP standards for extended shelf-life stability.',
          category: ScienceStepCategory.commercial,
          icon: Icons.factory_rounded,
          metricValue: '24 Mo.',
          metricLabel: 'Shelf Stability',
        ),
        ScienceStepModel(
          stepNumber: 10,
          title: 'Commercial Market Deployment',
          subtitle: 'B2B & B2C Distribution',
          description:
              'Global supply chain distribution of validated biological therapeutic formulations to health partners.',
          category: ScienceStepCategory.commercial,
          icon: Icons.local_shipping_rounded,
          metricValue: '4',
          metricLabel: 'Vertical Markets',
        ),
      ];
}
