// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vlr/main.dart';
import 'package:vlr/services/route_helper.dart';
import 'package:vlr/services/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class PriceConverter {
  static convert(price) {
    num _cleanPrice = price.replaceAll(',', '');

    return '₹ ${double.parse('$_cleanPrice').toStringAsFixed(2)}';
  }

  static convertRound(price) {
    num _cleanPrice = price.replaceAll(',', '');
    return '₹ ${double.parse('$_cleanPrice').toInt()}';
  }

  static convertToNumberFormat(num price) {
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(price)}';
  }
}

Widget sizedBoxHeight({required double height}) {
  return SizedBox(
    height: height.h,
  );
}

Widget sizedBoxWidth({required double width}) {
  return SizedBox(
    width: width.w,
  );
}

class Helper {
  final BuildContext context;
  Helper(this.context);

  Size get size => MediaQuery.sizeOf(context);
  TextTheme get textTheme => Theme.of(context).textTheme;
}

String capitalize(String? s) {
  if (s == null || s.isEmpty) return "";
  return s[0].toUpperCase() + s.substring(1);
}

void navigate({
  PageTransitionType type = PageTransitionType.fade,
  required BuildContext context,
  required Widget page,
  bool isReplace = false,
  bool isRemoveUntil = false,
  Duration duration = const Duration(milliseconds: 300),
}) {
  if (isReplace) {
    Navigator.of(context).pushReplacement(
      getCustomRoute(
        child: page,
        type: type,
        duration: duration,
      ),
    );
  } else if (isRemoveUntil) {
    Navigator.of(context).pushAndRemoveUntil(
      getCustomRoute(
        child: page,
        type: type,
        duration: duration,
      ),
      (route) => false,
    );
  } else {
    Navigator.of(context).push(
      getCustomRoute(
        child: page,
        type: type,
        duration: duration,
      ),
    );
  }
}

void pop(BuildContext context, {dynamic data}) {
  Navigator.pop(context, data);
}

enum ToastType {
  info(ToastificationType.info),
  warning(ToastificationType.warning),
  error(ToastificationType.error),
  success(ToastificationType.success);

  const ToastType(this.value);
  final ToastificationType value;
}

void showToast(
    {ToastType? toastType,
    required String message,
    String? description,
    ToastificationStyle? toastificationStyle,
    bool? typeCheck}) {
  toastification.show(
    alignment: Alignment.topLeft,
    type: toastType?.value ??
        ((typeCheck ?? false)
            ? ToastificationType.success
            : ToastificationType.error),
    title: Text(
      message,
      style:
          Helper(navigatorKey.currentContext!).textTheme.bodyMedium!.copyWith(
                color: black,
                fontSize: 14,
              ),
    ),
    description: description != null
        ? Text(description,
            style: Helper(navigatorKey.currentContext!)
                .textTheme
                .bodySmall!
                .copyWith(
                  color: black,
                ))
        : null,
    style: toastificationStyle ?? ToastificationStyle.minimal,
    icon: toastType == ToastType.success
        ? const Icon(Icons.check_circle_outline)
        : toastType == ToastType.error
            ? const Icon(Icons.error_outline)
            : toastType == ToastType.warning
                ? const Icon(Icons.warning_amber)
                : const Icon(Icons.info_outline),
    autoCloseDuration: const Duration(seconds: 2),
  );
}

String getStringFromList(List<dynamic>? data) {
  String str = data.toString();
  return data.toString().substring(1, str.length - 1);
}

class AppConstants {
  String get getBaseUrl => baseUrl;
  set setBaseUrl(String url) => baseUrl = url;

  //TODO: Change Base Url
  static String baseUrl = 'https://app.feetrack.in/api';
  // static String baseUrl = 'http://192.168.1.5:9000/'; ///USE FOR LOCAL
  //TODO: Change Base Url
  static String appName = 'App Name';

  static const String agoraAppId = 'c87b710048c049f59570bd1895b7e561';

  // Auth
  static const String registrationPost = '/partner/register';
  static const String loginPost = '/hrms/login';
  static const String logOutPost = '/hrms/logout';
  static const String updateFCMTokenPost = '/partner/fcm-token';
  static const String deleteAccountPost = ' /hrms/account/destroy';

  //* profile
  static const String getProfile = '/hrms/profile';
  static const String updateProfile = '/hrms/profile';

  //* Attendance
  static const String punchInAttendancePost = '/hrms/attendance/punch-in';
  static const String punchOutAttendancePost = '/hrms/attendance/punch-out';
  static const String todayAttendanceGet = '/hrms/attendance/today';
  static const String attendanceHistoryGet = '/hrms/attendance/history';

  //* Attendance Team
  static const String todayTeamAttendanceGet = '/hrms/team-attendance/today';
  static const String teamEmployeesListGet = '/hrms/team-attendance/employees';

  static const String employeeAttendanceGet = '/hrms/team-attendance/history';

  //* Check list point
  static const String checkListPointGet = '/hrms/attendance/checklists';
  static const String submitCheckListPointGet =
      '/hrms/attendance/submit-checklist';

  //*  list point

  //
  static const double horizontalPadding = 16;
  static const double verticalPadding = 20;
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
      horizontal: AppConstants.horizontalPadding,
      vertical: AppConstants.verticalPadding);

  // Shared Key
  static const String token = 'user_app_token';
  static const String userId = 'user_app_id';
  static const String razorpayKey = 'razorpay_key';
  static const String recentOrders = 'recent_orders';
  static const String isUser = 'is_user';
  static const String fcmToken = 'fcmToken';
}
