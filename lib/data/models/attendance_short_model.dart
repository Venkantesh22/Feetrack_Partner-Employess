import 'package:flutter/material.dart';
import 'package:vlr/services/theme.dart';

class AttendanceShortModel {
    final int? id;
    final DateTime? date;
    final String? status;
    final String? statusReason;
    final String? checkInTime;
    final String? checkOutTime;
    final String? workingHours;

    AttendanceShortModel({
        this.id,
        this.date,
        this.status,
        this.statusReason,
        this.checkInTime,
        this.checkOutTime,
        this.workingHours,
    });

    factory AttendanceShortModel.fromJson(Map<String, dynamic> json) => AttendanceShortModel(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        statusReason: json["status_reason"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        workingHours: json["working_hours"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date == null ? null : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "status_reason": statusReason,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "working_hours": workingHours,
    };

  bool get isNotPunchIn => status == "notPunchIn";
  bool get isWorking => status == "working";
  bool get isPunchOut => status == "punchOut";
  bool get isLeave => status == "leave";

  Color get statusColor => status == "present"
      ? yellow
      : status == "Checkout"
          ? greenDark1
          : status == "Checkout"
              ? red1
              : primaryColor;
}
