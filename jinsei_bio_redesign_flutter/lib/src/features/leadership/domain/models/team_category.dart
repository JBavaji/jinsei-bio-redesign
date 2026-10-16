enum TeamCategory {
  all(id: 'all', label: 'All Members'),
  executive(id: 'executive', label: 'Executive Leadership'),
  scientific(id: 'scientific', label: 'Scientific R&D'),
  product(id: 'product', label: 'Product & Growth'),
  operations(id: 'operations', label: 'Operations & Lab');

  final String id;
  final String label;

  const TeamCategory({required this.id, required this.label});

  static TeamCategory fromId(String id) {
    return TeamCategory.values.firstWhere(
      (c) => c.id.toLowerCase() == id.toLowerCase(),
      orElse: () => TeamCategory.all,
    );
  }
}
