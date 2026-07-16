import 'dart:ui';

import 'package:vlr/services/theme.dart';

class EmployeesModel {
  final String? id;
  final dynamic createdBy;
  final String? parentId;
  final String? departmentId;
  final String? reportingTo;
  final String? name;
  final String? email;
  final String? mobile;
  final String? role;
  final String? status;
  final String? walletBalance;
  final String? basicSalary;
  final dynamic emailVerifiedAt;
  final dynamic mobileVerifiedAt;
  final dynamic profileImage;
  final dynamic fcmToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? todayStatus;
  final String? checkInTime;
  final String? checkOutTime;
  final dynamic profileImageUrl;
  final int? attendanceId;

  EmployeesModel({
    this.id,
    this.createdBy,
    this.parentId,
    this.departmentId,
    this.reportingTo,
    this.name,
    this.email,
    this.mobile,
    this.role,
    this.status,
    this.walletBalance,
    this.basicSalary,
    this.emailVerifiedAt,
    this.mobileVerifiedAt,
    this.profileImage,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.todayStatus,
    this.checkInTime,
    this.checkOutTime,
    this.profileImageUrl,
    this.attendanceId,
  });

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        id: json["id"],
        createdBy: json["created_by"],
        parentId: json["parent_id"],
        departmentId: json["department_id"],
        reportingTo: json["reporting_to"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        role: json["role"],
        status: json["status"],
        walletBalance: json["wallet_balance"],
        basicSalary: json["basic_salary"],
        emailVerifiedAt: json["email_verified_at"],
        mobileVerifiedAt: json["mobile_verified_at"],
        profileImage: json["profile_image"],
        fcmToken: json["fcm_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        todayStatus: json["today_status"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        profileImageUrl: json["profile_image_url"],
        attendanceId: json["attendance_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "parent_id": parentId,
        "department_id": departmentId,
        "reporting_to": reportingTo,
        "name": name,
        "email": email,
        "mobile": mobile,
        "role": role,
        "status": status,
        "wallet_balance": walletBalance,
        "basic_salary": basicSalary,
        "email_verified_at": emailVerifiedAt,
        "mobile_verified_at": mobileVerifiedAt,
        "profile_image": profileImage,
        "fcm_token": fcmToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "today_status": todayStatus,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "profile_image_url": profileImageUrl,
        "attendance_id": attendanceId,
      };

  bool get isNotPunchIn => todayStatus == "notPunchIn";
  bool get isPunchIn => todayStatus == "working";
  bool get isPunchOut => todayStatus == "present";
  bool get isShortLeave => todayStatus == "short_leave";
  bool get isHalfDay => todayStatus == "half_day";
  bool get isAbsent => todayStatus == "absent";
  bool get isLeave => todayStatus == "leave";
  bool get isHoliday => todayStatus == "holiday";
  bool get isWeekOff => todayStatus == "weekOff";

  Color get statusColor {
    if (isNotPunchIn) return notPunchIn;
    if (isPunchIn) return punchIn;
    if (isPunchOut) return punchOut;
    if (isShortLeave) return shortLeave;
    if (isHalfDay) return halfDay;
    if (isAbsent) return absent;
    if (isLeave) return leave;
    if (isHoliday) return holiday;
    if (isWeekOff) return weekOff;

    return defaultColor;
  }
}
