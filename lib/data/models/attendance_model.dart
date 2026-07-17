import 'dart:ui';

import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';

class AttendanceModel {
  final int? id;
  final String? employeeId;
  final DateTime? date;
  final String? checkIn;
  final String? checkOut;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<CheckchecklistResponse>? checklistResponses;
  final List<CheckchecklistResponse>? checkOutChecklistResponses;
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
  final int? workingMinutes;
  final String? lateMinutes;

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
    this.checkOutChecklistResponses,
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
    this.workingMinutes,
    this.lateMinutes,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        id: json["id"],
        employeeId: json["employee_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        checkIn: json["check_in"],
        checkOut: json["check_out"],
        // status: json["status"],
        status: json["status"] ?? "working",

        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        checklistResponses: json["checklist_responses"] == null
            ? []
            : List<CheckchecklistResponse>.from(json["checklist_responses"]!
                .map((x) => CheckchecklistResponse.fromJson(x))),
        checkOutChecklistResponses:
            json["check_out_checklist_responses"] == null
                ? []
                : List<CheckchecklistResponse>.from(
                    json["check_out_checklist_responses"]!
                        .map((x) => CheckchecklistResponse.fromJson(x))),

        checkInLat: json["check_in_lat"] ?? "--",
        checkInLng: json["check_in_lng"] ?? "--",
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
        workingMinutes: json["working_minutes"],
        lateMinutes: json["late_minutes"],
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
        "checklist_responses": checklistResponses == null
            ? []
            : List<dynamic>.from(checklistResponses!.map((x) => x.toJson())),
        "check_out_checklist_responses": checkOutChecklistResponses == null
            ? []
            : List<dynamic>.from(
                checkOutChecklistResponses!.map((x) => x.toJson())),
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
        "working_minutes": workingMinutes,
        "late_minutes": lateMinutes,
      };

  String? get checkInTimeFormat {
    if (checkIn == null || (checkIn?.isEmpty ?? false)) {
      return "-- : --";
    }
    return convertTo12HourFormat(time24: checkIn, isShowAMPM: true);
  }

  String? get checkOutTimeFormat {
    if (checkOut == null || (checkOut?.isEmpty ?? false)) {
      return "-- : --";
    }
    return convertTo12HourFormat(time24: checkOut, isShowAMPM: true);
  }

  String? get workingTimeFormat {
    if (isPunchIn) {
      return getWorkingTime(checkIn);
    }
    return formatMinutesToHours(
         workingMinutes,);
  }

  bool get isNotPunchIn => status == "notPunchIn";
  bool get isPunchIn => status == "punch_in";
  bool get isPunchOut => status == "punch_out";
  bool get isShortLeave => status == "short_leave";
  bool get isHalfDay => status == "half_day";
  bool get isAbsent => status == "absent";
  bool get isLeave => status == "leave";
  bool get isHoliday => status == "holiday";
  bool get isWeekOff => status == "weekOff";

  bool get hasCheckOutLocation =>
      (checkOutLat?.isNotEmpty ?? false) && (checkOutLng?.isNotEmpty ?? false);

  bool get hasCheckInLocation =>
      (checkInLat?.isNotEmpty ?? false) && (checkInLng?.isNotEmpty ?? false);

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

  String get statusName {
    if (isNotPunchIn) return "Check-In Pending";
    if (isPunchIn) return "Working";
    if (isPunchOut) return "Punched Out";
    if (isShortLeave) return "Short Leave";
    if (isHalfDay) return "Half Day";
    if (isAbsent) return "Absent";
    if (isLeave) return "On Leave";
    if (isHoliday) return "Holiday";
    if (isWeekOff) return "Week Off";

    return "Unknown";
  }

  String get location {
    if (hasCheckOutLocation) {
      return "$checkOutLat, $checkOutLng";
    }

    if (hasCheckInLocation) {
      return "$checkInLat, $checkInLng";
    }

    return "--";
  }

  String? get image {
    if (hasCheckOutLocation) {
      return checkOutSelfieUrl;
    }

    if (hasCheckInLocation) {
      return checkInSelfieUrl;
    }

    return "";
  }
}

class EmployeesAttendanceSummaryModel {
  final int? punchOut;
  final int? absent;
  final int? halfDay;
  final int? punchIn;
  final int? leave;
  final int? holiday;
  final int? weekOff;
  final int? late;

  EmployeesAttendanceSummaryModel({
    this.punchOut,
    this.absent,
    this.halfDay,
    this.punchIn,
    this.leave,
    this.holiday,
    this.weekOff,
    this.late,
  });

  factory EmployeesAttendanceSummaryModel.fromJson(Map<String, dynamic> json) =>
      EmployeesAttendanceSummaryModel(
        punchOut: json["punch_out"],
        absent: json["absent"],
        halfDay: json["half_day"],
        punchIn: json["punch_in"],
        leave: json["leave"],
        holiday: json["holiday"],
        weekOff: json["weekOff"],
        late: json["late"],
      );

  Map<String, dynamic> toJson() => {
        "punch_out": punchOut,
        "absent": absent,
        "half_day": halfDay,
        "punch_in": punchIn,
        "leave": leave,
        "holiday": holiday,
        "weekOff": weekOff,
        "late": late,
      };
}

class CheckchecklistResponse {
  final String? question;
  final bool? answer;

  CheckchecklistResponse({
    this.question,
    this.answer,
  });

  factory CheckchecklistResponse.fromJson(Map<String, dynamic> json) =>
      CheckchecklistResponse(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
