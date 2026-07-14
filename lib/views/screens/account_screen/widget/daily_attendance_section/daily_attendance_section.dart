import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/shimmer.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/attendance_status_widget.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/not_punchin_mid_wiget.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/punch_in_and_punch_out_widget.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/punch_out_button.dart';
import 'package:vlr/views/screens/attendance/attendance_mart_screen/attendance_mart_screen.dart';

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
      child: GetBuilder<AttendanceController>(builder: (attendanceController) {
        return Column(
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
                attendanceController.attendanceModel?.isPresent ?? false
                    ? const AttendanceStatusWidget()
                    : const SizedBox(),
              ],
            ),
            sizedBoxHeight(height: 24.h),
            attendanceController.attendanceModel?.isNotPunchIn ?? false
                ? const NotPunchInMidWidget()
                : const SizedBox(),
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
                Expanded(
                  child: CustomShimmer(
                    isLoading: attendanceController.isLoading,
                    child: PunchInAndPunchOutWidget(
                        title: "Punch In",
                        subTitle:
                            (attendanceController.attendanceModel?.checkIn !=
                                        null ||
                                    (attendanceController.attendanceModel
                                            ?.checkIn?.isNotEmpty ??
                                        false))
                                ? convertTo12HourFormat(
                                    time24: attendanceController
                                            .attendanceModel?.checkIn ??
                                        "",
                                    isShowAMPM: true,
                                  )
                                : "-- : --"),
                  ),
                ),
                Container(
                  width: 1,
                  height: 70.h,
                  color: greyLight6,
                ),
                Expanded(
                  child: CustomShimmer(
                    isLoading: attendanceController.isLoading,
                    child: PunchInAndPunchOutWidget(
                        title: "Punch out",
                        subTitle:
                            (attendanceController.attendanceModel?.checkOut !=
                                    null)
                                ? convertTo12HourFormat(
                                    time24: attendanceController
                                            .attendanceModel?.checkOut ??
                                        "",
                                    isShowAMPM: true,
                                  )
                                : "-- : --"),
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
            attendanceController.attendanceModel?.isPunchOut ?? false
                ? Padding(
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
                          style:
                              Helper(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 16.sp,
                                    color: blackText1,
                                  ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            PunchButtonWidget(
              onTap: () {
                navigate(context: context, page: const AttendanceMartScreen());
              },
            )
          ],
        );
      }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:vlr/controllers/attendance_controller.dart';
// import 'package:vlr/services/constants.dart';
// import 'package:vlr/services/custom_text.dart';
// import 'package:vlr/services/date_formatters_and_converters.dart';
// import 'package:vlr/services/theme.dart';
// import 'package:vlr/views/base/shimmer.dart';
// import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/punch_in_and_punch_out_widget.dart';
// import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/punch_out_button.dart';
// import 'package:vlr/views/screens/attendance/attendance_mart_screen/attendance_mart_screen.dart';

// class DailyAttendanceSection extends StatelessWidget {
//   const DailyAttendanceSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: white,
//         borderRadius: BorderRadius.circular(12.r),
//         border: const Border(left: BorderSide(width: 4, color: greenDark)),
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 1),
//             blurRadius: 2,
//             spreadRadius: 0,
//             color: black.withValues(
//               alpha: 0.05,
//             ),
//           )
//         ],
//       ),
//       child: GetBuilder<AttendanceController>(builder: (attendanceController) {
//         String? title;
//         Color? bgColor;
//         Color? textColor;

//         // if (attendanceController.attendanceModel?.status == "Not Checked") {
//         //   title = attendanceController.attendanceModel?.status;
//         //   bgColor = greyLight6;
//         //   textColor = greyDart3;
//         // } else if (attendanceController.attendanceModel?.status == "present") {
//         //   title = attendanceController.attendanceModel?.status;
//         //   bgColor = green.withValues(alpha: 0.1);
//         //   textColor = greenDark;
//         // } else if (attendanceController.attendanceModel?.status ==
//         //     "Punch out") {
//         //   title = attendanceController.attendanceModel?.status;
//         //   bgColor = greyLight6;
//         //   textColor = greyDart3;
//         // }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomText(
//                   "Daily Attendance",
//                   style: Helper(context).textTheme.labelMedium?.copyWith(
//                         fontSize: 18,
//                       ),
//                 ),
//                 CustomShimmer(
//                   isLoading: attendanceController.isLoading,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 12.w,
//                       vertical: 4.h,
//                     ),
//                     decoration: BoxDecoration(
//                       color: bgColor,
//                       borderRadius: BorderRadius.circular(99.r),
//                     ),
//                     child: CustomText(
//                       capitalize(title ?? ""),
//                       style: Helper(context).textTheme.titleMedium?.copyWith(
//                             fontSize: 14.sp,
//                             color: textColor,
//                           ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 20.h,
//                 bottom: 8.h,
//               ),
//               child: Divider(
//                 color: greyLight6,
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomShimmer(
//                     isLoading: attendanceController.isLoading,
//                     child: PunchInAndPunchOutWidget(
//                         title: "Punch In",
//                         subTitle:
//                             (attendanceController.attendanceModel?.checkIn !=
//                                         null ||
//                                     (attendanceController.attendanceModel
//                                             ?.checkIn?.isNotEmpty ??
//                                         false))
//                                 ? convertTo12HourFormat(
//                                     time24: attendanceController
//                                             .attendanceModel?.checkIn ??
//                                         "",
//                                     isShowAMPM: true,
//                                   )
//                                 : "-- : --"),
//                   ),
//                 ),
//                 Container(
//                   width: 1,
//                   height: 70.h,
//                   color: greyLight6,
//                 ),
//                 Expanded(
//                   child: CustomShimmer(
//                     isLoading: attendanceController.isLoading,
//                     child: PunchInAndPunchOutWidget(
//                         title: "Punch out",
//                         subTitle:
//                             (attendanceController.attendanceModel?.checkOut !=
//                                     null)
//                                 ? convertTo12HourFormat(
//                                     time24: attendanceController
//                                             .attendanceModel?.checkOut ??
//                                         "",
//                                     isShowAMPM: true,
//                                   )
//                                 : "-- : --"),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 8.h,
//                 bottom: 8.h,
//               ),
//               child: Divider(
//                 color: greyLight6,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 10.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     "Working Hours",
//                     style: Helper(context).textTheme.bodyLarge?.copyWith(
//                           fontSize: 14.sp,
//                           color: greyDart2,
//                         ),
//                   ),
//                   CustomText(
//                     "09:23 Hrs",
//                     style: Helper(context).textTheme.titleMedium?.copyWith(
//                           fontSize: 16.sp,
//                           color: blackText1,
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//             PunchButtonWidget(
//               onTap: () {
//                 navigate(context: context, page: const AttendanceMartScreen());
//               },
//             )
//           ],
//         );
//       }),
//     );
//   }
// }
