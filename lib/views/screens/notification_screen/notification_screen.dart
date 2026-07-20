import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vlr/controllers/notice_controller.dart';
import 'package:vlr/data/models/notice_model.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/base/shimmer.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/notification_section/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 2,
        title: CustomText(
          "Notifications",
          style: Helper(context).textTheme.titleMedium?.copyWith(
                fontSize: 20.sp,
              ),
        ),
      ),
      body: GetBuilder<NoticeController>(builder: (noticeController) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final noticeModel = noticeController.isLoading
                ? NoticeModel()
                : noticeController.noticeModelList[index];
            return CustomShimmer(
              isLoading: noticeController.isLoading,
              child: NotificationWidget(
                noticeModel: noticeModel,
              ),
            );
          },
          itemCount: noticeController.isLoading
              ? 4
              : noticeController.noticeModelList.length,
        );
      }),
    );
  }
}
