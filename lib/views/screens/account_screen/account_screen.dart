import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vlr/services/constants.dart';
import 'package:vlr/services/custom_text.dart';
import 'package:vlr/services/theme.dart';
import 'package:vlr/views/screens/account_screen/widget/account_option_section/account_option_section.dart';
import 'package:vlr/views/screens/account_screen/widget/daily_attendance_section/daily_attendance_section.dart';
import 'package:vlr/views/screens/account_screen/widget/reporting_manager_widget.dart';
import 'package:vlr/views/screens/dashboard/home_screen/widget/use_info_top_home_section.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          "Account",
          style: Helper(context).textTheme.titleMedium?.copyWith(
                fontSize: 16,
                color: white,
              ),
        ),
        leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
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
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const UserInfoTopHome(),
            sizedBoxHeight(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const DailyAttendanceSection(),
                  sizedBoxHeight(height: 16.h),
                  const ReportingManagerWidget(),
                  sizedBoxHeight(height: 24.h),
                  const AccountOptionSection(),
                  sizedBoxHeight(height: 24.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
