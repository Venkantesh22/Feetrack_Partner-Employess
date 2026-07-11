import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
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
  Future<Response> fetchAttendanceHistory() async => await apiClient.getData(
        AppConstants.attendanceHistoryGet,
        "fetchAttendanceHistory",
      );
}
