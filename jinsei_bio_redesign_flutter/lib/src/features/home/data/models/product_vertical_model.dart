class ProductVerticalModel {
  final String title;
  final String strainId;
  final String description;

  const ProductVerticalModel({
    required this.title,
    required this.strainId,
    required this.description,
  });

  static const List<ProductVerticalModel> defaultVerticals = [
    ProductVerticalModel(
      title: 'Jinsei-Gut Pro',
      strainId: 'Strain ID: L. rhamnosus JN-01',
      description:
          'Advanced digestive support matrix utilizing native flora extraction and gastro-resistant spore technology.',
    ),
    ProductVerticalModel(
      title: 'FemmeFlora Bio-Shield',
      strainId: 'Strain ID: L. crispatus JN-02',
      description:
          'Targeted microbiome balancing for specialized female wellness, vaginal tract stability, and immune homeostasis.',
    ),
    ProductVerticalModel(
      title: 'MetaboliMet Probiotic',
      strainId: 'Strain ID: L. plantarum JN-04',
      description:
          'Metabolic optimization complex developed from isolated indigenous cultures targeting lipid signaling pathways.',
    ),
  ];
}
