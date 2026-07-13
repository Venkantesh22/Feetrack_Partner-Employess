import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/team_attendaance_history_screen/widget/appbar_and_searchbar.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/team_attendaance_history_screen/widget/employee_widget.dart';

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
    return Scaffold(
      body: Column(
        children: [
          AppBarAndSearchBar(
            title: "Team Attendance History",
            onChanged: (value) {},
          ),
          Expanded(
            child: Padding(
              padding: AppConstants.screenPadding,
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return const EmployeeWidget();
                  },
                  separatorBuilder: (_, __) => sizedBoxHeight(height: 16.h),
                  shrinkWrap: true,
                  itemCount: 10),
            ),
          )
        ],
      ),
    );
  }
}
