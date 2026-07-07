import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/check_in_and_check_out_widget.dart';

class CheckInandCheckOutWidgetTodayStatus extends StatelessWidget {
  const CheckInandCheckOutWidgetTodayStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 1,
              color: greyLight6,
            ),
          ),
          child: const CheckInAndCheckOutWidget(title: "CHECK IN TIME"),
        ),
        sizedBoxWidth(width: 6.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 1,
              color: greyLight6,
            ),
          ),
          child: const CheckInAndCheckOutWidget(title: "CHECK OUT TIME"),
        ),
      ],
    );
  }
}
