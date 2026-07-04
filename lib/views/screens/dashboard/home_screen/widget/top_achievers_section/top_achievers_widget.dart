import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';

class TopAchieversWidget extends StatelessWidget {
  const TopAchieversWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: pinkLight2,
      ),
      child: Column(
        children: [
          CustomImage(
            path: Assets.imagesProfile,
            height: 46.h,
            width: 46.w,
            fit: BoxFit.cover,
            radius: 100.r,
          ),
          sizedBoxHeight(height: 8),
          CustomText(
            "Manash Rout",
            style: Helper(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          CustomText(
            "Onboardings: 28",
            style: Helper(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12.sp,
                ),
          ),
          CustomText(
            "Amount: 129000",
            style: Helper(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12.sp,
                ),
          ),
        ],
      ),
    );
  }
}
