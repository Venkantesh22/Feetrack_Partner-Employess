import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/data/models/employee_model.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_image.dart';
import 'package:vlr/views/screens/attendance/team_attendance_history/employee_attendance_history_screen/employee_attendance_history_screen.dart';

class EmployeeTodayTeamAttendanceWidget extends StatelessWidget {
  final EmployeesModel? employeesModel;
  const EmployeeTodayTeamAttendanceWidget({
    super.key,
    this.employeesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 1,
            color: greyLight1,
          ),
          color: white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
              color: black.withValues(alpha: 0.05),
            )
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 64.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: greyLight6,
                        )),
                    child: CustomImage(
                      path: employeesModel?.profileImageUrl ?? "",
                      radius: 999.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 16.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: white),
                          color: greenDark1,
                        ),
                      ))
                ],
              ),
              sizedBoxWidth(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      employeesModel?.name ?? "",
                      maxLines: 2,
                      style: Helper(context).textTheme.titleMedium?.copyWith(
                            fontSize: 18.sp,
                            color: blackText3,
                          ),
                    ),
                    CustomText(
                      employeesModel?.role ?? "",
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14.sp,
                            color: primaryColor,
                          ),
                    ),
                    CustomText(
                      "Employee Id : ${employeesModel?.id ?? ""}",
                      style: Helper(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: greyLight1,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Row(
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
                            "Punch In",
                            style:
                                Helper(context).textTheme.titleMedium?.copyWith(
                                      fontSize: 10,
                                    ),
                          ),
                          CustomText(
                            convertTo12HourFormat(
                              time24: employeesModel?.checkInTime ?? "",
                            ),
                            style:
                                Helper(context).textTheme.titleMedium?.copyWith(
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
                            "Punch out",
                            style:
                                Helper(context).textTheme.titleMedium?.copyWith(
                                      fontSize: 10,
                                    ),
                          ),
                          CustomText(
                            convertTo12HourFormat(
                              time24: employeesModel?.checkOutTime ?? "",
                            ),
                            style:
                                Helper(context).textTheme.titleMedium?.copyWith(
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
          ),
          sizedBoxHeight(height: 16.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                navigate(
                  context: context,
                  page: const EmployeeAttendanceHistoryScreen(),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    "View History",
                    style: Helper(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                          color: tertiaryColor,
                        ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16.sp,
                    color: tertiaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
