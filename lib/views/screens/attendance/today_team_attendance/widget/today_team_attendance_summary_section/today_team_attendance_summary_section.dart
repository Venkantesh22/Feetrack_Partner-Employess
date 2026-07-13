import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';

class TodayTeamAttendanceSummarySection extends StatelessWidget {
  const TodayTeamAttendanceSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border:
              Border.all(width: 1, color: greyLight6.withValues(alpha: 0.30)),
          color: white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
              color: black.withValues(alpha: 0.05),
            )
          ]),
      child: Column(
        children: [
          CustomText(
            "Today Team Attendance Summary",
            maxLines: 2,
            style: Helper(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 24.sp,
                  color: blackText3,
                ),
          ),
          sizedBoxHeight(height: 24.h),
          
        ],
      ),
    );
  }
}
