import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_list_section/attendance_list_section.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_summary_section/attendance_summary_section.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/select_month_widget.dart';
import 'package:vlr/views/widget/button/appbar_back_button.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AttendanceController>().fetchAttendanceHistoryPagination();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 85.h,
        backgroundColor: primaryColor,
        leading: const AppBarBackButton(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Attendance History",
              style: Helper(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    color: white,
                  ),
            ),
            CustomText(
              "Track your attendance records",
              style: Helper(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: white,
                  ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppConstants.screenPadding,
          child: Column(
            children: [
              SelectMonthWidget(),
              sizedBoxHeight(height: 24.h),
              AttendanceSummarySection(),
              sizedBoxHeight(height: 24.h),
              AttendanceListSection()
            ],
          ),
        ),
      ),
    );
  }
}
