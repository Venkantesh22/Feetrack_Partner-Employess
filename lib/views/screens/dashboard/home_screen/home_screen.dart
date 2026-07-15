import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/controllers/auth_controller.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/date_formatters_and_converters.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/account_screen/account_screen.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/notification_section/notification_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/quick_action_section/quick_action_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/this_month_target_section/this_month_target_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/top_achievers_section/top_achievers_section.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/use_info_top_home_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().fetchProfile();
      final attendanceController = Get.find<AttendanceController>();
      attendanceController.selectedMonth = getDateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigate(context: context, page: AccountScreen());
            },
            icon: Icon(
              // Icons.menu,
              Icons.settings_outlined,
              color: white,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: white,
            ),
          )
        ],
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        if (authController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              const UserInfoTopHome(),
              sizedBoxHeight(height: 16.h),
              const TopAchieversSection(),
              sizedBoxHeight(height: 16.h),
              const ThisMonthTargetSection(),
              sizedBoxHeight(height: 16.h),
              const NotificationSection(),
              sizedBoxHeight(height: 16.h),
              const QuickActionsSection(),
            ],
          ),
        );
      }),
    );
  }
}
