import 'package:flutter/material.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/theme.dart';

class AttendanceSummaryModel {
  final IconData icon;
  final String title;
  final String? count;
  final Color color;

  AttendanceSummaryModel(
      {required this.icon,
      required this.title,
      required this.count,
      required this.color});
}

List<AttendanceSummaryModel> attendanceSummaryModelList(
        {required AttendanceController attendanceController}) =>
    [
      AttendanceSummaryModel(
          icon: Icons.check, title: "Present", count: "8", color: greenDark1),
      AttendanceSummaryModel(
          icon: Icons.cancel, title: "Absent", count: "1", color: red1),
      AttendanceSummaryModel(
          icon: Icons.watch_later_outlined,
          title: "Pending",
          count: "8",
          color: yellow),
      // AttendanceSummaryModel(
      //     icon: Icons.edit_calendar_outlined,
      //     title: "Leave",
      //     count: "2",
      //     color: primaryColor),
    ];
