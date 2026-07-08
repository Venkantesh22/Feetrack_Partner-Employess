import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:vlr/controllers/lead_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/custom_button.dart';
import 'package:vlr/views/base/custom_dropdown.dart';
import 'package:vlr/views/widget/text_box/app_text_box.dart';

class LeadCreateScreen extends StatefulWidget {
  const LeadCreateScreen({super.key});

  @override
  State<LeadCreateScreen> createState() => _LeadCreateScreenState();
}

class _LeadCreateScreenState extends State<LeadCreateScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LeadController>().businessAmountController.text = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: AppConstants.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<LeadController>(builder: (leadController) {
              return CustomButton(
                height: 50,
                isLoading: leadController.isLoading,
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {}
                },
                child: CustomText(
                  "Save Lead",
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
          "New Lead",
          style: Helper(context).textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: GetBuilder<LeadController>(builder: (leadController) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Name",
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
                  controller: leadController.nameLeadController,
                  hindText: "Enter lead name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a name for lead";
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(height: 24.h),
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Business Name",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  controller: leadController.businessNameController,
                  hindText: "Enter business Name",
                ),
                sizedBoxHeight(height: 24.h),
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Phone number",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: leadController.businessNameController,
                  hindText: "Enter business phone no.",
                ),
                sizedBoxHeight(height: 24.h),
                CustomDropDownList(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Product Interest",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  value: leadController.productInterest,
                  items: leadController.productInterestList,
                  hintText: "Select Product Interest",
                  onChanged: (value) {
                    leadController.productInterest = value;
                    leadController.update();
                  },
                ),
                sizedBoxHeight(height: 24.h),
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Business Amount",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  controller: leadController.businessAmountController,
                  hindText: "Enter business Name",
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
                  value: leadController.status,
                  items: leadController.statusList,
                  hintText: "Select status",
                  onChanged: (value) {
                    leadController.status = value;
                    leadController.update();
                  },
                ),
                sizedBoxHeight(height: 24.h),
                CustomDropDownList(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Assign To",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  value: leadController.assignTo,
                  items: leadController.assignToList,
                  hintText: "Select assign to",
                  onChanged: (value) {
                    leadController.assignTo = value;
                    leadController.update();
                  },
                ),
                sizedBoxHeight(height: 24.h),
                AppTextFieldWithHeading(
                  headingWidget: Row(
                    children: [
                      CustomText(
                        "Requirements",
                        style: Helper(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  maxLines: 5,
                  controller: leadController.requirementController,
                  hindText: "Enter your Requirements..",
                ),
                sizedBoxHeight(height: 24.h),
              ],
            ),
          );
        }),
      ),
    );
  }
}
