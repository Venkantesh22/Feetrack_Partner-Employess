import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';

class NotPunchInMidWidget extends StatelessWidget {
  const NotPunchInMidWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: greenDark2.withValues(alpha: 0.1),
            ),
            child: SvgPicture.asset(
              Assets.svgsAleamWatch,
              height: 32.h,
              width: 32.w,
              fit: BoxFit.cover,
            ),
          ),
          sizedBoxHeight(height: 12.h),
          CustomText(
            "Good Morning!",
            style: Helper(context).textTheme.labelMedium?.copyWith(
                  fontSize: 20,
                  color: blackText4,
                ),
          ),
          sizedBoxHeight(height: 4.h),
          CustomText(
            "You haven't punched in yet. Your working day has not started.",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Helper(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: greyLight8,
                ),
          ),
        ],
      ),
    );
  }
}
