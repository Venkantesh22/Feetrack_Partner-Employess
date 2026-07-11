import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/views/screens/attendance/attendance_history/widget/attendance_summary_section/attendance_summary_model.dart';

class AttendanceSummaryWidget extends StatelessWidget {
  final AttendanceSummaryModel attendanceSummaryModel;
  const AttendanceSummaryWidget({
    super.key,
    required this.attendanceSummaryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: attendanceSummaryModel.color.withValues(alpha: 0.10),
          ),
          child: Icon(
            attendanceSummaryModel.icon,
            color: attendanceSummaryModel.color,
            size: 20.sp,
          ),
        ),
        sizedBoxHeight(height: 8.h),
        CustomText(
          attendanceSummaryModel.title,
          style: Helper(context).textTheme.titleMedium?.copyWith(
                fontSize: 12,
              ),
        ),
        sizedBoxHeight(height: 8.h),
        CustomText(
          attendanceSummaryModel.count ?? "",
          style: Helper(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 20.sp, color: attendanceSummaryModel.color),
        ),
      ],
    );
  }
}
