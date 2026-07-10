import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/base/shimmer.dart';
import 'package:vlr/views/screens/edit_profile/edit_profile_screen.dart';

class UserInfoTopHome extends StatelessWidget {
  const UserInfoTopHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return CustomShimmer(
        isLoading: authController.isLoading,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (authController.isLoading) {
                      return;
                    }
                    navigate(context: context, page: const EditProfileScreen());
                  },
                  child: Row(
                    children: [
                      CustomImage(
                        path: (authController.userModel?.profileImage != null ||
                                (authController
                                        .userModel?.profileImage?.isNotEmpty ??
                                    false))
                            ? (authController.userModel?.profileImage ??
                                Assets.imagesNoProfile)
                            : Assets.imagesNoProfile,
                        height: 60.h,
                        width: 60.w,
                        isProfile: true,
                        radius: 999,
                        fit: BoxFit.cover,
                      ),
                      sizedBoxWidth(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Hi, ${authController.userModel?.name ?? ""}",
                              style: Helper(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 16.sp,
                                    color: white,
                                  ),
                            ),
                            sizedBoxHeight(height: 4.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        capitalize(
                                            authController.userModel?.role ??
                                                ""),
                                        style: Helper(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 12.sp,
                                              color: white,
                                            ),
                                      ),
                                      sizedBoxHeight(height: 2.h),
                                      CustomText(
                                        "Business ID: FT1256",
                                        style: Helper(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
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
                    ],
                  ),
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
                        DateFormatters().dayFull.format(getDateTime()),
                        style: Helper(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.sp,
                              color: white,
                            ),
                      ),
                      CustomText(
                        DateFormatters().dMy.format(getDateTime()),
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
        ),
      );
    });
  }
}
