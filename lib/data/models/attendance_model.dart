class AttendanceModel {
  final int? id;
  final String? employeeId;
  final DateTime? date;
  final String? checkIn;
  final String? checkOut;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic checklistResponses;
  final String? checkInLat;
  final String? checkInLng;
  final dynamic checkInPhoto;
  final String? checkInSelfie;
  final String? checkOutLat;
  final String? checkOutLng;
  final dynamic checkOutPhoto;
  final String? checkOutSelfie;
  final String? checkInSelfieUrl;
  final String? checkOutSelfieUrl;
  final dynamic checkInPhotoUrl;
  final dynamic checkOutPhotoUrl;

  AttendanceModel({
    this.id,
    this.employeeId,
    this.date,
    this.checkIn,
    this.checkOut,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.checklistResponses,
    this.checkInLat,
    this.checkInLng,
    this.checkInPhoto,
    this.checkInSelfie,
    this.checkOutLat,
    this.checkOutLng,
    this.checkOutPhoto,
    this.checkOutSelfie,
    this.checkInSelfieUrl,
    this.checkOutSelfieUrl,
    this.checkInPhotoUrl,
    this.checkOutPhotoUrl,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        id: json["id"],
        employeeId: json["employee_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        checkIn: json["check_in"],
        checkOut: json["check_out"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        checklistResponses: json["checklist_responses"],
        checkInLat: json["check_in_lat"],
        checkInLng: json["check_in_lng"],
        checkInPhoto: json["check_in_photo"],
        checkInSelfie: json["check_in_selfie"],
        checkOutLat: json["check_out_lat"],
        checkOutLng: json["check_out_lng"],
        checkOutPhoto: json["check_out_photo"],
        checkOutSelfie: json["check_out_selfie"],
        checkInSelfieUrl: json["check_in_selfie_url"],
        checkOutSelfieUrl: json["check_out_selfie_url"],
        checkInPhotoUrl: json["check_in_photo_url"],
        checkOutPhotoUrl: json["check_out_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_id": employeeId,
        "date": date?.toIso8601String(),
        "check_in": checkIn,
        "check_out": checkOut,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "checklist_responses": checklistResponses,
        "check_in_lat": checkInLat,
        "check_in_lng": checkInLng,
        "check_in_photo": checkInPhoto,
        "check_in_selfie": checkInSelfie,
        "check_out_lat": checkOutLat,
        "check_out_lng": checkOutLng,
        "check_out_photo": checkOutPhoto,
        "check_out_selfie": checkOutSelfie,
        "check_in_selfie_url": checkInSelfieUrl,
        "check_out_selfie_url": checkOutSelfieUrl,
        "check_in_photo_url": checkInPhotoUrl,
        "check_out_photo_url": checkOutPhotoUrl,
      };
}
