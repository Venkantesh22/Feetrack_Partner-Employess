import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/this_month_target_section/monthly_target_model.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/this_month_target_section/target_card.dart';

class ThisMonthTargetSection extends StatelessWidget {
  const ThisMonthTargetSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
            color: black.withValues(alpha: 0.05),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "This Month Targets",
                style: Helper(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              CustomText(
                DateFormatters().My.format(getDateTime()),
                style: Helper(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14.sp, color: greyDart2),
              ),
            ],
          ),
          sizedBoxHeight(height: 12.h),
          Row(
            children: [
              Expanded(child: TargetCard(target: monthlyTargets[0])),
              SizedBox(width: 6.w),
              Expanded(child: TargetCard(target: monthlyTargets[1]))
            ],
          )
          // SizedBox(
          //   height: 100.h,
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: monthlyTargets.length,
          //     separatorBuilder: (_, __) => SizedBox(width: 6.w),
          //     itemBuilder: (_, index) {
          //       return TargetCard(
          //         target: monthlyTargets[index],
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
