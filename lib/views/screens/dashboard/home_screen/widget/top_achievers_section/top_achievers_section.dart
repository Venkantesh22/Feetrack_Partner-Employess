import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/top_achievers_section/top_achievers_widget.dart';

class TopAchieversSection extends StatelessWidget {
  const TopAchieversSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
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
                "Top Achievers",
                style: Helper(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              CustomButton(
                onTap: () {},
                type: ButtonType.tertiary,
                child: CustomText(
                  "View All",
                  style: Helper(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.sp,
                        color: tertiaryColor,
                      ),
                ),
              ),
            ],
          ),
          sizedBoxHeight(height: 16.h),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(width: 200, child: TopAchieversWidget());
                },
                separatorBuilder: (_, __) => sizedBoxWidth(width: 12.w),
                itemCount: 4),
          )
        ],
      ),
    );
  }
}
