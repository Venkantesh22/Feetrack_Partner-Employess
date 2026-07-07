import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';

class CaptureVerificationSection extends StatelessWidget {
  const CaptureVerificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: greyLight6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                24.r,
              ),
              topRight: Radius.circular(
                24.r,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: blueLight3,
              ),
              sizedBoxWidth(width: 8.w),
              CustomText(
                "CAPTURE VERIFICATION",
                style: Helper(context).textTheme.labelMedium?.copyWith(
                      fontSize: 14,
                      color: greyDart2,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: greyLight6),
              left: BorderSide(width: 1, color: greyLight6),
              right: BorderSide(width: 1, color: greyLight6),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                24.r,
              ),
              bottomRight: Radius.circular(
                24.r,
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 250.h,
                width: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  color: black.withValues(
                    alpha: 0.95,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videocam_off_outlined,
                      color: white,
                      size: 40.sp,
                    ),
                    CustomText(
                      "Camera is off",
                      style: Helper(context).textTheme.labelMedium?.copyWith(
                            fontSize: 12,
                            color: white,
                          ),
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(height: 24),
              CustomButton(
                height: 52.h,
                onTap: () {},
                radius: 999.r,
                type: ButtonType.secondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: blueLight3,
                    ),
                    sizedBoxWidth(width: 12.w),
                    CustomText(
                      "Start Camera",
                      style: Helper(context).textTheme.titleMedium?.copyWith(
                            fontSize: 16.sp,
                            color: blueLight3,
                          ),
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: blueLight3,
                  ),
                  sizedBoxWidth(width: 12.w),
                  CustomText(
                    "Location pending...",
                    style: Helper(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16.sp,
                          color: greyDart2,
                        ),
                  ),
                ],
              ),
              sizedBoxHeight(height: 32.h),
              CustomButton(
                height: 64.h,
                onTap: () {},
                color: greenLight,
                borderColor: greenLight,
                radius: 32.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      color: white,
                    ),
                    sizedBoxWidth(width: 12.w),
                    CustomText(
                      "Check In",
                      style: Helper(context).textTheme.titleMedium?.copyWith(
                            fontSize: 24.sp,
                            color: white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
