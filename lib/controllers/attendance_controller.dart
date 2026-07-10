import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:vlr/data/models/attendance_model.dart';
import 'package:vlr/data/models/response/response_model.dart';
import 'package:vlr/data/repositories/attendence_repo.dart';

enum EmployeesStatus {
  notCheckedIn,
  present,
  checkedOut,
}

class AttendanceController extends GetxController implements GetxService {
  final AttendanceRepo attendanceRepo;

  AttendanceController({required this.attendanceRepo});

  bool isLoading = false;

  EmployeesStatus employeesStatus = EmployeesStatus.notCheckedIn;

  Future<ResponseModel> punchInAttendance({
    required String lat,
    required String lng,
    required File? selfie,
  }) async {
    log('----------- punchInAttendance Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {
        "lat": lat,
        "lng": lng,
        "selfie": selfie == null
            ? null
            : MultipartFile(
                selfie,
                filename: selfie.path.split('/').last,
              ),
      };

      Response response =
          await attendanceRepo.punchInAttendance(data: FormData(data));

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "punchInAttendance successful",
        );
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while punchInAttendance user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT punchInAttendance(): $e');
      responseModel =
          ResponseModel(false, "Error while punchInAttendance user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> punchOutAttendance({
    required String lat,
    required String lng,
    required File? selfie,
  }) async {
    log('----------- punchOutAttendance Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {
        "lat": lat,
        "lng": lng,
        "selfie": selfie == null
            ? null
            : MultipartFile(
                selfie,
                filename: selfie.path.split('/').last,
              ),
      };

      Response response =
          await attendanceRepo.punchOutAttendance(data: FormData(data));

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "punchOutAttendance successful",
        );
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while punchOutAttendance user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT punchOutAttendance(): $e');
      responseModel =
          ResponseModel(false, "Error while punchOutAttendance user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  AttendanceModel? attendanceModel;
  Future<ResponseModel> fetchTodayAttendance() async {
    log('----------- fetchTodayAttendance Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Response response = await attendanceRepo.fetchTodayAttendance();

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchTodayAttendance successful",
        );

        attendanceModel = AttendanceModel.fromJson(response.body['data']);

        // employeesStatus = attendanceModel.status ;
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while fetchTodayAttendance user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchTodayAttendance(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchTodayAttendance user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }
}
