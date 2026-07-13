import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/attendance/today_team_attendance/widget/today_team_attendance_summary_section/today_team_attendance_summary_widget.dart';

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
              offset: const Offset(0, 1),
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
          Row(
            children: [
              const Expanded(
                child: TodayTeamAttendanceSummaryWidget(
                  title: "Punch In",
                  subTitle: "18",
                  icon: Assets.svgsPunchIn,
                  color: greenDark1,
                ),
              ),
              Container(
                width: 1,
                height: 100.h,
                color: greyLight2,
              ),
              const Expanded(
                child: TodayTeamAttendanceSummaryWidget(
                  title: "Punch out",
                  subTitle: "10",
                  icon: Assets.svgsLogout,
                  color: organ,
                ),
              ),
              Container(
                width: 1,
                height: 100.h,
                color: greyLight2,
              ),
              const Expanded(
                child: TodayTeamAttendanceSummaryWidget(
                  title: "Absent",
                  subTitle: "10",
                  icon: Assets.svgsAbsent,
                  color: red1,
                ),
              ),
              Container(
                width: 1,
                height: 100.h,
                color: greyLight2,
              ),
              Expanded(
                child: TodayTeamAttendanceSummaryWidget(
                  title: "Leave",
                  subTitle: "2",
                  icon: Assets.svgsLeave,
                  color: blueLight3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
