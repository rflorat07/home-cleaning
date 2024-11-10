class WorkingHourModel {
  WorkingHourModel({
    required this.label,
    required this.hours,
  });

  factory WorkingHourModel.fromJson(Map<String, dynamic> json) =>
      WorkingHourModel(
        label: json['label'],
        hours: json['hours'],
      );
  String label;
  String hours;

  Map<String, dynamic> toJson() => {
        'label': label,
        'hours': hours,
      };
}
