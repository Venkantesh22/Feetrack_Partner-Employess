import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/team_attendaance_history_screen/widget/appbar_and_searchbar.dart';
import 'package:vlr/views/screens/attendance/today_team_attendance/widget/today_team_attendance_summary_section/today_team_attendance_summary_section.dart';

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
    return Scaffold(
      body: Column(
        children: [
          AppBarAndSearchBar(
            title: "Today Team Attendance",
            onChanged: (value) {},
          ),
          Padding(
            padding: AppConstants.screenPadding,
            child: Column(
              children: [
                TodayTeamAttendanceSummarySection(),
                ListView.separated(
                  itemBuilder: (context, index) {
                    return Container();
                  },
                  separatorBuilder: (_, __) => sizedBoxHeight(height: 16.h),
                  itemCount: 10,
                  shrinkWrap: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
