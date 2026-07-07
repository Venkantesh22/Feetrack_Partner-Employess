import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/controllers/attendence_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/check_in_and_check_out_widget.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/check_out_button.dart';

class DailyAttendanceSection extends StatelessWidget {
  const DailyAttendanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: const Border(left: BorderSide(width: 4, color: greenDark)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: black.withValues(
              alpha: 0.05,
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "Daily Attendance",
                style: Helper(context).textTheme.labelMedium?.copyWith(
                      fontSize: 18,
                    ),
              ),
              GetBuilder<AttendanceController>(
                builder: (controller) {
                  String? title;
                  Color? bgColor;
                  Color? textColor;

                  if (controller.isCheckIn && controller.isCheckout) {
                    title = "Not Checked";
                    bgColor = greyLight6;
                    textColor = greyDart3;
                  } else if (controller.isCheckIn) {
                    title = "Checked In";
                    bgColor = green.withValues(alpha: 0.1);
                    textColor = greenDark;
                  } else if (!controller.isCheckIn && !controller.isCheckout) {
                    title = "Not Checked In";
                    bgColor = greyLight6;
                    textColor = greyDart3;
                  }

                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(99.r),
                    ),
                    child: CustomText(
                      title ?? "",
                      style: Helper(context).textTheme.titleMedium?.copyWith(
                            fontSize: 14.sp,
                            color: textColor,
                          ),
                    ),
                  );
                },
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 8.h,
            ),
            child: Divider(
              color: greyLight6,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: CheckInAndCheckOutWidget(
                  title: "Check In",
                  subTitle: "09:15 AM",
                ),
              ),
              Container(
                width: 1,
                height: 70.h,
                color: greyLight6,
              ),
              const Expanded(
                child: CheckInAndCheckOutWidget(
                  title: "Check Out",
                  subTitle: null,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              bottom: 8.h,
            ),
            child: Divider(
              color: greyLight6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Working Hours",
                  style: Helper(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.sp,
                        color: greyDart2,
                      ),
                ),
                CustomText(
                  "09:23 Hrs",
                  style: Helper(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: blackText1,
                      ),
                ),
              ],
            ),
          ),
          const CheckButtonWidget()
        ],
      ),
    );
  }
}
