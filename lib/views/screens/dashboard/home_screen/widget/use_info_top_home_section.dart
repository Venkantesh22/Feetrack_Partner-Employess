import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';

class UserInfoTopHome extends StatelessWidget {
  const UserInfoTopHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImage(
            path: Assets.imagesNoProfile,
            height: 60.h,
            width: 60.w,
            fit: BoxFit.cover,
          ),
          sizedBoxWidth(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "Hi, Venkatesh Rathod",
                  style: Helper(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: white,
                      ),
                ),
                sizedBoxHeight(height: 4.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            "Field Sales",
                            style:
                                Helper(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: 12.sp,
                                      color: white,
                                    ),
                          ),
                          sizedBoxHeight(height: 2.h),
                          CustomText(
                            "Business ID: FT1256",
                            style:
                                Helper(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: 12.sp,
                                      color: white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: 30.sp,
                color: white,
              ),
              sizedBoxWidth(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Friday",
                    style: Helper(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.sp,
                          color: white,
                        ),
                  ),
                  CustomText(
                    "12 Jan 26",
                    style: Helper(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          color: white,
                        ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
