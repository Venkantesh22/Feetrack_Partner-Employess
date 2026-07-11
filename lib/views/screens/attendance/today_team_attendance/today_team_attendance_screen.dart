import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';

class TodayTeamAttendanceScreen extends StatefulWidget {
  const TodayTeamAttendanceScreen({super.key});

  @override
  State<TodayTeamAttendanceScreen> createState() =>
      _TodayTeamAttendanceScreenState();
}

class _TodayTeamAttendanceScreenState extends State<TodayTeamAttendanceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AttendanceController>().fetchTodayAttendance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
