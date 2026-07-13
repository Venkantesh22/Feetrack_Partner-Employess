import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_list_section/attendance_list_section.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/employee_attendance_history_screen/widget/appbar_of_employee_section/appbar_of_employee_section.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/employee_attendance_history_screen/widget/attendance_of_attendance_heading.dart';

class EmployeeAttendanceHistoryScreen extends StatelessWidget {
  const EmployeeAttendanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarOfEmployeeSection(),
            sizedBoxHeight(height: 20.h),
            const RowOfAttendanceHeading(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const AttendanceListSection(),
            )
          ],
        ),
      ),
    );
  }
}
