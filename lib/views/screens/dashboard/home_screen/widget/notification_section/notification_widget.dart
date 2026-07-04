import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 60.h,
            width: 60.w,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                color: deepPurple.withValues(alpha: 0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(
              Assets.svgsMegaphone,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                deepPurple,
                BlendMode.srcIn,
              ),
            )),
        sizedBoxWidth(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "Team Meeting Tomorrow at 10:00 AM",
                style: Helper(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              sizedBoxHeight(height: 6.h),
              CustomText(
                "Team Meeting Tomorrow at 10:00 AM Team Meeting Tomorrow at 10:00 AM Team Meeting Tomorrow at 10:00 AMTeam Meeting Tomorrow at 10:00 AM",
                maxLines: 3,
                style: Helper(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
              ),
              sizedBoxHeight(height: 4.h),
              CustomText(
                DateFormatters().dateTime.format(getDateTime()),
                style: Helper(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 10.sp,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
