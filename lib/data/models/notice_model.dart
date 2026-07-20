import 'package:vlr/services/date_formatters_and_converters.dart';

class NoticeModel {
  final int? id;
  final String? title;
  final String? content;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? type;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NoticeModel({
    this.id,
    this.title,
    this.content,
    this.startDate,
    this.endDate,
    this.type,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        type: json["type"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "type": type,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  String get startDateFormat =>
      DateFormatters().mdy.format(startDate ?? getDateTime());

  String get endDateFormat =>
      DateFormatters().mdy.format(endDate ?? getDateTime());
}
