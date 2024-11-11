import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewModel {
  ReviewModel({
    required this.rating,
    required this.avatar,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        rating: json['rating']?.toDouble(),
        avatar: json['avatar'],
        comment: json['comment'],
        date: DateTime.parse(json['date']),
        reviewerName: json['reviewerName'],
        reviewerEmail: json['reviewerEmail'],
      );
  double rating;
  String avatar;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'avatar': avatar,
        'comment': comment,
        'date': date.toIso8601String(),
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };

  /// Get date as a string for display.
  String getFormattedDate() {
    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

  String timeagoFormat() {
    return timeago.format(date);
  }
}
