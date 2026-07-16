import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/attendance/attendacn_details/widget/punch_in_and_out_attendance_section.dart';
import 'package:vlr/views/screens/attendance/attendacn_details/widget/session_summary_section/session_summary_section.dart';
import 'package:vlr/views/screens/attendance/attendacn_details/widget/top_status_section.dart';
import 'package:vlr/views/widget/button/appbar_back_button.dart';

class AttendanceDetailsScreen extends StatefulWidget {
  const AttendanceDetailsScreen({super.key});

  @override
  State<AttendanceDetailsScreen> createState() =>
      _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AttendanceController>().fetchAttendanceDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 26, 69, 1),
        toolbarHeight: 80.h,
        leading: const AppBarBackButton(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Attendance Details",
              style: Helper(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20.sp,
                    color: white,
                  ),
            ),
            GetBuilder<AttendanceController>(builder: (attendanceController) {
              return CustomText(
                "${DateFormat(
                  'MMMM d, yyyy • EEEE',
                ).format(attendanceController.attendanceModel?.date ?? DateTime.now())} ",
                style: Helper(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: white,
                    ),
              );
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Column(
          children: [
            TopStatusSection(),
            sizedBoxHeight(height: 16.h),
            PunchInAndOutAttendanceDetailsSection(),
            sizedBoxHeight(height: 16.h),
            SessionSummarySection()
          ],
        ),
      ),
    );
  }
}
