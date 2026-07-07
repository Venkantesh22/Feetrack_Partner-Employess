import 'package:flutter/material.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/attendance_mart/widget/capture_vetification_section.dart';
import 'package:vlr/views/screens/attendance_mart/widget/today_status_section/today_status_section.dart';

class AttendanceMartScreen extends StatelessWidget {
  const AttendanceMartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Attendance",
          style: Helper(context).textTheme.titleMedium?.copyWith(
                fontSize: 24,
              ),
        ),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Mark Attendance",
              style: Helper(context).textTheme.titleMedium?.copyWith(
                    fontSize: 28,
                    color: blackText3,
                  ),
            ),
            CustomText(
              "Capture your selfie and GPS location to check in/out.",
              style: Helper(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    color: greyDart2,
                  ),
            ),
            sizedBoxHeight(height: 24),
            CaptureVerificationSection(),
            sizedBoxHeight(height: 24),
            TodayStatus()
          ],
        ),
      ),
    );
  }
}
