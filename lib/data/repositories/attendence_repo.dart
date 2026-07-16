import 'package:get/get.dart';
import 'package:vlr/data/api/api_client.dart';
import 'package:vlr/services/constants.dart';

class AttendanceRepo {
  final ApiClient apiClient;

  AttendanceRepo({required this.apiClient});

  Future<Response> punchInAttendance({required FormData data}) async =>
      await apiClient.postData(
        AppConstants.punchInAttendancePost,
        "punchInAttendance",
        data,
      );

  Future<Response> punchOutAttendance({required FormData data}) async =>
      await apiClient.postData(
        AppConstants.punchOutAttendancePost,
        "punchOutAttendance",
        data,
      );

  Future<Response> fetchTodayAttendance() async => await apiClient.getData(
        AppConstants.todayAttendanceGet,
        "fetchTodayAttendance",
      );
  Future<Response> fetchAttendanceHistory(
          {required Map<String, dynamic>? data}) async =>
      await apiClient.getData(
        AppConstants.attendanceHistoryGet,
        "fetchAttendanceHistory",
        query: data,
      );

  Future<Response> fetchTodayTeamAttendance() async => await apiClient.getData(
        AppConstants.todayTeamAttendanceGet,
        "fetchTodayTeamAttendance",
        // query: data,
      );

  Future<Response> fetchTeamEmployeesList(
          {required Map<String, dynamic>? data}) async =>
      await apiClient.getData(
        AppConstants.teamEmployeesListGet,
        "fetchTeamEmployeesList",
        query: data,
      );

  Future<Response> fetchCheckListPoint(
          {required Map<String, dynamic>? data}) async =>
      await apiClient.getData(
        AppConstants.checkListPointGet,
        "fetchCheckListPoint",
        query: data,
      );

  Future<Response> submitCheckListPoint({required FormData data}) async =>
      await apiClient.postData(
        AppConstants.submitCheckListPointGet,
        "submitCheckListPoint",
        data,
      );

  Future<Response> fetchTeamEmployeeAttendanceList(
          {required Map<String, dynamic>? data}) async =>
      await apiClient.getData(
        AppConstants.employeeAttendanceGet,
        "fetchTeamEmployeeAttendanceList",
        query: data,
      );

  Future<Response> fetchAttendanceDetails({required int attendanceId}) async =>
      await apiClient.getData(
        "${AppConstants.employeeAttendanceGet}/$attendanceId",
        "fetchAttendanceDetails",
      );
}
