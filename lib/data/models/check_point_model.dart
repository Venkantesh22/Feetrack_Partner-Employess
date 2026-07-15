class CheckPointModel {
  final int? id;
  final String? partnerId;
  final String? question;
  final String? mode;
  final bool? isActive;
  bool? isChecked;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CheckPointModel({
    this.id,
    this.partnerId,
    this.question,
    this.mode,
    this.isActive,
    this.isChecked,
    this.createdAt,
    this.updatedAt,
  });

  factory CheckPointModel.fromJson(Map<String, dynamic> json) =>
      CheckPointModel(
        id: json["id"],
        partnerId: json["partner_id"],
        question: json["question"],
        mode: json["mode"],
        isActive: json["is_active"],
        isChecked: json["is_checked"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "partner_id": partnerId,
        "question": question,
        "mode": mode,
        "is_active": isActive,
        "is_checked": isChecked,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  Map<String, dynamic> toSubmitJson() {
    return {
      "id": id,
      "isChecked": isChecked ?? false,
    };
  }
}
