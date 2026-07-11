import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';

class TeamAttendanceHistoryScreen extends StatefulWidget {
  const TeamAttendanceHistoryScreen({super.key});

  @override
  State<TeamAttendanceHistoryScreen> createState() =>
      _TeamAttendanceHistoryScreenState();
}

class _TeamAttendanceHistoryScreenState
    extends State<TeamAttendanceHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AttendanceController>().fetchTeamAttendanceHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
