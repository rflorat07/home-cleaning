class ChipModel {
  ChipModel({
    required this.title,
    required this.selected,
  });

  final String title;
  bool selected;
}

List<ChipModel> demoChip = [
  ChipModel(title: 'ALL', selected: false),
  ChipModel(title: 'Cleaning', selected: true),
  ChipModel(title: 'Repairing', selected: false),
  ChipModel(title: 'Plumbing', selected: false),
];
