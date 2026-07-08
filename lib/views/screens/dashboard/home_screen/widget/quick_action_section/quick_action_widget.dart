import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vlr/generated/assets.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/task/create_new_task/create_new_task_screen.dart';

class QuickActionWidget extends StatelessWidget {
  final QuickActionModel quickActionModel;
  const QuickActionWidget({
    super.key,
    required this.quickActionModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: quickActionModel.onTap,
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: quickActionModel.color.withValues(
                  alpha: 0.10,
                )),
            child: SvgPicture.asset(
              quickActionModel.icon,
              colorFilter:
                  ColorFilter.mode(quickActionModel.color, BlendMode.srcIn),
            ),
          ),
          sizedBoxHeight(height: 12.h),
          CustomText(
            quickActionModel.title,
            style: Helper(context).textTheme.titleMedium?.copyWith(
                  fontSize: 10.sp,
                ),
          ),
        ],
      ),
    );
  }
}

class QuickActionModel {
  final String icon;
  final String title;
  final Color color;
  final Function()? onTap;

  QuickActionModel(
      {required this.icon,
      required this.title,
      required this.color,
      required this.onTap});
}

List<QuickActionModel> quickActionModelList({required BuildContext context}) =>
    [
      QuickActionModel(
          icon: Assets.svgsLocation,
          title: "Location",
          color: Colors.greenAccent,
          onTap: () {}),
      QuickActionModel(
        icon: Assets.svgsPerson,
        title: "Lead Create",
        color: tertiaryColor,
        onTap: () {},
      ),
      QuickActionModel(
        icon: Assets.svgsDocument,
        title: "Order Create",
        color: Colors.orange.shade400,
        onTap: () {},
      ),
      QuickActionModel(
        icon: Assets.svgsList,
        title: "My List",
        color: Colors.purple.shade500,
        onTap: () {},
      ),
      QuickActionModel(
        icon: Assets.svgsGraph,
        title: "Reports",
        color: greenDark,
        onTap: () {},
      ),
      QuickActionModel(
        icon: Assets.svgsTask,
        title: "Task",
        color: tertiaryColor,
        onTap: () {
          navigate(context: context, page: const CreateNewTaskScreen());
        },
      )
    ];
