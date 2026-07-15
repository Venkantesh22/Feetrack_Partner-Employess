import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_summary_section/attendance_summary_model.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_summary_section/attendance_summary_widget.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/this_month_target_section/half_circle_progress.dart';

class AttendanceSummarySection extends StatelessWidget {
  const AttendanceSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(builder: (attendanceController) {
      final now = DateTime.now();
      final selected = attendanceController.selectedMonth;

      final isCurrentMonth =
          selected.year == now.year && selected.month == now.month;
      final list = attendanceSummaryModelList(
          attendanceController: attendanceController);

      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            width: 1,
            color: greyLight7,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              spreadRadius: 0,
              blurRadius: 12,
              color: black.withValues(
                alpha: 0.005,
              ),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    "Attendance Summary",
                    style: Helper(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          color: blackText1,
                        ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: greyLight1,
                  ),
                  child: CustomText(
                    isCurrentMonth
                        ? "This Month"
                        : DateFormat('MMMM')
                            .format(selected), // July, August...
                    style: Helper(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12,
                          color: tertiaryColor,
                        ),
                  ),
                )
              ],
            ),
            sizedBoxHeight(height: 24.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 100.h,
                    child: Row(
                      children: List.generate(
                        list.length * 2,
                        (index) {
                          if (index.isOdd) {
                            return Container(
                              width: 1,
                              color: greyLight6,
                            );
                          }

                          final item = list[index ~/ 2];

                          return Expanded(
                            child: AttendanceSummaryWidget(
                              attendanceSummaryModel: item,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      CustomText(
                        "Attendance",
                        style: Helper(context).textTheme.bodyLarge?.copyWith(
                              color: greyDart2,
                              fontSize: 16,
                            ),
                      ),
                      SizedBox(
                        height: 90.h,
                        child: HalfCircleProgress(
                          percent: 0.79,
                          progressColor: tertiaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
