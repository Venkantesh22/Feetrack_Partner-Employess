import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/data/models/attendance_model.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';

class AttendanceWidget extends StatelessWidget {
  final AttendanceModel attendanceModel;
  const AttendanceWidget({
    super.key,
    required this.attendanceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: greyLight7),
        borderRadius: BorderRadius.circular(16.r),
        color: white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: black.withValues(alpha: 0.05),
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99.r),
                              color: attendanceModel.statusColor
                                  .withValues(alpha: 0.10),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 4.r,
                                  backgroundColor: attendanceModel.statusColor,
                                ),
                                sizedBoxWidth(width: 4.w),
                                CustomText(
                                  capitalize(attendanceModel.status ?? ""),
                                  style: Helper(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 10.sp,
                                        color: attendanceModel.statusColor,
                                      ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              CustomText(
                                DateFormatters().dMyDash.format(
                                      attendanceModel.date ?? getDateTime(),
                                    ),
                                style: Helper(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.sp,
                                      color: greyDart2,
                                    ),
                              ),
                              sizedBoxWidth(width: 4.w),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: greyDart2,
                                size: 16.sp,
                              ),
                              sizedBoxWidth(width: 4.w),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                        ),
                        child: Divider(
                          color: greyLight6,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: green2.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: const Icon(
                                    Icons.login,
                                    color: green2,
                                  ),
                                ),
                                sizedBoxWidth(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      "Check In",
                                      style: Helper(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 10,
                                          ),
                                    ),
                                    CustomText(
                                      convertTo12HourFormat(
                                          time24:
                                              attendanceModel.checkIn ?? ""),
                                      style: Helper(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 10,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: greyLight6,
                            width: 1,
                            height: 50.h,
                          ),
                          sizedBoxWidth(width: 16.w),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: red1.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: const Icon(
                                    Icons.logout,
                                    color: red1,
                                  ),
                                ),
                                sizedBoxWidth(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      "Check out",
                                      style: Helper(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 10,
                                          ),
                                    ),
                                    CustomText(
                                      convertTo12HourFormat(
                                          time24:
                                              attendanceModel.checkOut ?? ""),
                                      style: Helper(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 10,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Divider(
                          color: greyLight6,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: greyDart2.withValues(
                                alpha: 0.10,
                              ),
                            ),
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: greyDart2,
                              size: 20.sp,
                            ),
                          ),
                          sizedBoxWidth(width: 8.w),
                          Expanded(
                            child: CustomText(
                              "Working Hours",
                              style: Helper(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 10, color: greyDart2),
                            ),
                          ),
                          CustomText(
                            "09h, 23m",
                            style: Helper(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 11, color: blackText3),
                          ),
                          sizedBoxWidth(width: 10.w)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 6.w,
                color: attendanceModel.statusColor,
              )),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vlr/data/models/attendance_model.dart';
// import 'package:vlr/services/constants.dart';
// import 'package:vlr/services/custom_text.dart';
// import 'package:vlr/services/date_formatters_and_converters.dart';
// import 'package:vlr/services/theme.dart';
// import 'package:vlr/views/base/custom_image.dart';

// class AttendanceWidget extends StatelessWidget {
//   final AttendanceModel attendanceModel;
//   const AttendanceWidget({
//     super.key,
//     required this.attendanceModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: greyLight7),
//         borderRadius: BorderRadius.circular(16.r),
//         color: white,
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 1),
//             blurRadius: 2,
//             spreadRadius: 0,
//             color: black.withValues(alpha: 0.05),
//           )
//         ],
//       ),
//       child: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.all(16.w),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(8.w),
//                   decoration: BoxDecoration(
//                       color:
//                           attendanceModel.statusColor.withValues(alpha: 0.10),
//                       borderRadius: BorderRadius.circular(12.r)),
//                   child: Column(
//                     children: [
//                       CustomText(
//                         DateFormatters()
//                             .date
//                             .format(attendanceModel.date ?? getDateTime()),
//                         style: Helper(context).textTheme.titleMedium?.copyWith(
//                               fontSize: 24.sp,
//                               color: attendanceModel.statusColor,
//                             ),
//                       ),
//                       sizedBoxHeight(height: 6.h),
//                       CustomText(
//                         DateFormatters()
//                             .month
//                             .format(attendanceModel.date ?? getDateTime()),
//                         style: Helper(context).textTheme.titleMedium?.copyWith(
//                               fontSize: 8.sp,
//                               color: attendanceModel.statusColor,
//                             ),
//                       ),
//                       sizedBoxHeight(height: 6.h),
//                       CustomText(
//                         DateFormatters()
//                             .day
//                             .format(attendanceModel.date ?? getDateTime()),
//                         style: Helper(context).textTheme.titleMedium?.copyWith(
//                               fontSize: 8.sp,
//                               color: attendanceModel.statusColor,
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 sizedBoxWidth(width: 8.w),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 8.w,
//                               vertical: 4.h,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(99.r),
//                               color: attendanceModel.statusColor
//                                   .withValues(alpha: 0.10),
//                             ),
//                             child: Row(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 4.r,
//                                   backgroundColor: attendanceModel.statusColor,
//                                 ),
//                                 sizedBoxWidth(width: 4.w),
//                                 CustomText(
//                                   capitalize(attendanceModel.status ?? ""),
//                                   style: Helper(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.copyWith(
//                                         fontSize: 10.sp,
//                                         color: attendanceModel.statusColor,
//                                       ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.watch_later_outlined,
//                                 color: attendanceModel.statusColor,
//                               ),
//                               sizedBoxWidth(width: 4.w),
//                               CustomText(
//                                 "11h 02m",
//                                 style: Helper(context)
//                                     .textTheme
//                                     .titleMedium
//                                     ?.copyWith(
//                                       fontSize: 10.sp,
//                                       color: attendanceModel.statusColor,
//                                     ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 8.h,
//                         ),
//                         child: Divider(
//                           color: greyLight6,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Row(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(8.w),
//                                   decoration: BoxDecoration(
//                                     color: green2.withValues(alpha: 0.1),
//                                     borderRadius: BorderRadius.circular(8.r),
//                                   ),
//                                   child: const Icon(
//                                     Icons.login,
//                                     color: green2,
//                                   ),
//                                 ),
//                                 sizedBoxWidth(width: 8.w),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CustomText(
//                                       "Check In",
//                                       style: Helper(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontSize: 10,
//                                           ),
//                                     ),
//                                     CustomText(
//                                       convertTo12HourFormat(
//                                           time24:
//                                               attendanceModel.checkIn ?? ""),
//                                       style: Helper(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontSize: 10,
//                                           ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             color: greyLight6,
//                             width: 1,
//                             height: 50.h,
//                           ),
//                           sizedBoxWidth(width: 16.w),
//                           Expanded(
//                             child: Row(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(8.w),
//                                   decoration: BoxDecoration(
//                                     color: red1.withValues(alpha: 0.1),
//                                     borderRadius: BorderRadius.circular(8.r),
//                                   ),
//                                   child: const Icon(
//                                     Icons.logout,
//                                     color: red1,
//                                   ),
//                                 ),
//                                 sizedBoxWidth(width: 8.w),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CustomText(
//                                       "Check out",
//                                       style: Helper(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontSize: 10,
//                                           ),
//                                     ),
//                                     CustomText(
//                                       convertTo12HourFormat(
//                                           time24:
//                                               attendanceModel.checkOut ?? ""),
//                                       style: Helper(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontSize: 10,
//                                           ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Icon(Icons.arrow_forward_ios_rounded)
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(8.w, 8.h,
//                             MediaQuery.of(context).size.width / 4, 8.h),
//                         child: Divider(
//                           color: greyLight6,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(8.w),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.r),
//                               color: greyDart2.withValues(
//                                 alpha: 0.10,
//                               ),
//                             ),
//                             child: Icon(
//                               Icons.location_on_outlined,
//                               color: greyDart2,
//                               size: 20.sp,
//                             ),
//                           ),
//                           sizedBoxWidth(width: 8.w),
//                           CustomText(
//                             attendanceModel.location,
//                             style: Helper(context)
//                                 .textTheme
//                                 .titleMedium
//                                 ?.copyWith(fontSize: 10, color: greyDart2),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//               left: 0,
//               top: 0,
//               bottom: 0,
//               child: Container(
//                 width: 6.w,
//                 color: attendanceModel.statusColor,
//               )),
//           Positioned(
//             right: 16.h,
//             bottom: 16.w,
//             child: CustomImage(
//               path: attendanceModel.image ?? "",
//               height: 48.h,
//               width: 48.w,
//               fit: BoxFit.cover,
//               radius: 12,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
