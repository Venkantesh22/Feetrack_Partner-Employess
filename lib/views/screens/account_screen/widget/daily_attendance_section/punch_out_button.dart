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
      if (attendanceController.attendanceModel?.status == "Not Checked") {
        title = "PunchedIn";
        icon = Icons.login;
        color = green;
      } else if (attendanceController.attendanceModel?.status == "Punch out") {
        title = "Punchedout Done";
        icon = Icons.logout;
        color = primaryColor;
      } else if (attendanceController.attendanceModel?.status == "present") {
        title = "PunchedOut";
        icon = Icons.logout;
        color = redDark;
      }

      return CustomButton(
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
      );
    });
  }
}
