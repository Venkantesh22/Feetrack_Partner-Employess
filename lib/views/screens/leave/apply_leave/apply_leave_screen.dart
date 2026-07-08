import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:vlr/controllers/leave_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_dropdown.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class ApplyLeaveScreen extends StatefulWidget {
  const ApplyLeaveScreen({super.key});

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<LeaveController>(builder: (leaveController) {
              return CustomButton(
                height: 50,
                isLoading: leaveController.isLoading,
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {}
                },
                child: CustomText(
                  "Submit Application",
                  style: Helper(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 16.sp, color: white),
                ),
              );
            })
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: CustomText(
          "Apply for Leave",
          style: Helper(context).textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: GetBuilder<LeaveController>(builder: (leaveController) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Start Date",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                      CustomText(
                        " *",
                        style: Helper(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 18.sp, color: redDark),
                      ),
                    ],
                  ),
                  controller: leaveController.startDateController,
                  hindText: "dd-mm-yyyy",
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      leaveController.startDateController.text =
                          "${pickedDate.day.toString().padLeft(2, '0')}-"
                          "${pickedDate.month.toString().padLeft(2, '0')}-"
                          "${pickedDate.year}";
                    }
                  },
                  suffix: const Icon(Icons.calendar_month),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Select start date";
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(height: 24.h),
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "End Date",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                      CustomText(
                        " *",
                        style: Helper(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 18.sp, color: redDark),
                      ),
                    ],
                  ),
                  controller: leaveController.endDateController,
                  hindText: "dd-mm-yyyy",
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      leaveController.endDateController.text =
                          "${pickedDate.day.toString().padLeft(2, '0')}-"
                          "${pickedDate.month.toString().padLeft(2, '0')}-"
                          "${pickedDate.year}";
                    }
                  },
                  suffix: const Icon(Icons.calendar_month),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Select start date";
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(height: 24.h),
                CustomDropDownList(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Status",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  value: leaveController.leaveType,
                  items: leaveController.leaveTypeList,
                  hintText: "Select Status",
                  onChanged: (value) {
                    leaveController.leaveType = value;
                    leaveController.update();
                  },
                ),
                sizedBoxHeight(height: 24.h),
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Reason for Leave",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  controller: leaveController.reasonForLeaveController,
                  hindText: "Enter reason for leave...",
                  maxLines: 5,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
