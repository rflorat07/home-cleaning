class ChipModel {
  ChipModel({
    required this.title,
    required this.selected,
  });

  final String title;
  bool selected;
}

List<ChipModel> demoChip = [
  ChipModel(title: 'All', selected: true),
  ChipModel(title: 'Cleaning', selected: false),
  ChipModel(title: 'Repairing', selected: false),
  ChipModel(title: 'Plumbing', selected: false),
];
