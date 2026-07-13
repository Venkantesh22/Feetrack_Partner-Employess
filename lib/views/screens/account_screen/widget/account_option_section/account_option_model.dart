import 'package:flutter/widgets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/screens/attendance/attendance_history/attendance_history_screen.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/team_attendaance_history_screen/team_attendance_history_screen.dart';
import 'package:vlr/views/screens/attendance/today_team_attendance/today_team_attendance_screen.dart';
import 'package:vlr/views/screens/leave/apply_leave/apply_leave_screen.dart';

class AccountOptionModel {
  final String icon;
  final String title;
  final Function()? onTap;

  AccountOptionModel(
      {required this.icon, required this.title, required this.onTap});
}

List<AccountOptionModel> accountOptionModelList(
        {required BuildContext context}) =>
    [
      AccountOptionModel(
          icon: Assets.svgsPerson2,
          title: "Personal Information",
          onTap: () {}),
      AccountOptionModel(
          icon: Assets.svgsCalender,
          title: "Apply for Leave",
          onTap: () {
            navigate(context: context, page: const ApplyLeaveScreen());
          }),
      AccountOptionModel(
          icon: Assets.svgsClock,
          title: "Attendance History",
          onTap: () {
            navigate(context: context, page: const AttendanceHistoryScreen());
          }),
      AccountOptionModel(
          icon: Assets.svgsClock,
          title: "Today Team Attendance",
          onTap: () {
            navigate(context: context, page: const TodayTeamAttendanceScreen());
          }),
      AccountOptionModel(
          icon: Assets.svgsClock,
          title: "Team Attendance History",
          onTap: () {
            navigate(
                context: context, page: const TeamAttendanceHistoryScreen());
          }),
      AccountOptionModel(
          icon: Assets.svgsNotification, title: "Notifications", onTap: () {}),
      AccountOptionModel(
          icon: Assets.svgsPrivacyPolicy,
          title: "Privacy Policy",
          onTap: () {}),
      AccountOptionModel(
          icon: Assets.svgsHelpAndSupport,
          title: "Help & Support",
          onTap: () {}),
      AccountOptionModel(
          icon: Assets.svgsTermAndCondition,
          title: "Terms & Conditions",
          onTap: () {}),
    ];
