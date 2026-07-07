import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vlr/controllers/attendence_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';

class CheckButtonWidget extends StatelessWidget {
  const CheckButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(builder: (attendanceController) {
      String? title;
      IconData? icon;
      Color? color;
      if (attendanceController.isCheckIn && attendanceController.isCheckout) {
        title = "Checked out Done";
        icon = Icons.logout;
        color = primaryColor;
      } else if (attendanceController.isCheckIn) {
        title = "Checked Out";
        icon = Icons.logout;
        color = redDark;
      } else if (!attendanceController.isCheckIn &&
          !attendanceController.isCheckout) {
        title = "Checked In";
        icon = Icons.login;
        color = green;
      }

      return CustomButton(
        height: 48.h,
        onTap: () {},
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
      );
    });
  }
}
