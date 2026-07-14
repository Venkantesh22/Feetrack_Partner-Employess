import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';

class PunchButtonWidget extends StatelessWidget {
  final Function() onTap;
  const PunchButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(builder: (attendanceController) {
      String? title;
      IconData? icon;
      Color? color;
      if (attendanceController.attendanceModel?.isNotPunchIn ?? false) {
        title = "Punch In";
        icon = Icons.login;
        color = green;
      } else if (attendanceController.attendanceModel?.status == "Punch out") {
        title = "Punch out Done";
        icon = Icons.logout;
        color = primaryColor;
      } else if (attendanceController.attendanceModel?.status == "present") {
        title = "Punch Out";
        icon = Icons.logout;
        color = redDark;
      }

      if (attendanceController.attendanceModel?.isNotPunchIn ?? false) {
        return Column(
          children: [
            CustomButton(
              height: 48.h,
              onTap: onTap,
              color: color,
              borderColor: color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: white,
                  ),
                  sizedBoxWidth(width: 12.w),
                  CustomText(
                    title ?? "",
                    style: Helper(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          color: white,
                        ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: greenDark2.withValues(
                    alpha: 0.1,
                  ),
                  border: Border.all(
                    width: 1,
                    color: greenDark2.withValues(
                      alpha: 0.2,
                    ),
                  )),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: green2,
                  ),
                  sizedBoxWidth(width: 12.w),
                  Expanded(
                    child: CustomText(
                      "Please punch in when you start working.",
                      style: Helper(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: greyDart3,
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }
      return const SizedBox();
    });
  }
}
