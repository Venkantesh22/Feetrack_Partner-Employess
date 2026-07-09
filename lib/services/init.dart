import 'dart:developer';
import 'package:get/instance_manager.dart';
import 'package:vlr/controllers/attendance_controller.dart';
import 'package:vlr/controllers/basic_controller.dart';
import 'package:vlr/controllers/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vlr/controllers/lead_controller.dart';
import 'package:vlr/controllers/leave_controller.dart';
import 'package:vlr/controllers/task_controller.dart';
import 'package:vlr/data/repositories/attendence_repo.dart';
import 'package:vlr/data/repositories/lead_repo.dart';
import 'package:vlr/data/repositories/leave_repo.dart';
import 'package:vlr/data/repositories/task_repo.dart';
import '../controllers/auth_controller.dart';
import '../controllers/permission_controller.dart';
import '../data/api/api_client.dart';
import '../data/repositories/auth_repo.dart';
import '../data/repositories/basic_repo.dart';
import 'constants.dart';

class Init {
  initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);

    try {
      // ApiClient
      Get.lazyPut(() => ApiClient(
          appBaseUrl: AppConstants.baseUrl,
          sharedPreferences: sharedPreferences));

      Get.lazyPut(() => PermissionController());

      // Get Repo's...
      Get.lazyPut(
          () => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
      Get.lazyPut(() => BasicRepo(dioClient: Get.find()));
      Get.lazyPut(() => AttendanceRepo(apiClient: Get.find()));
      Get.lazyPut(() => TaskRepo(apiClient: Get.find()));
      Get.lazyPut(() => LeadRepo(apiClient: Get.find()));
      Get.lazyPut(() => LeaveRepo(apiClient: Get.find()));

      // Get Controller's...
      Get.lazyPut(() => DashBoardController());
      Get.lazyPut(() => BasicController(basicRepo: Get.find()));
      Get.lazyPut(() => AuthController(authRepo: Get.find()));
      Get.lazyPut(() => AttendanceController(attendanceRepo: Get.find()));
      Get.lazyPut(() => TaskController(taskRepo: Get.find()));
      Get.lazyPut(() => LeadController(leadRepo: Get.find()));
      Get.lazyPut(() => LeaveController(leaveRepo: Get.find()));
    } catch (e) {
      log('---- ${e.toString()} ----', name: "ERROR AT initialize()");
    }
  }
}
