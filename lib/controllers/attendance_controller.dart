import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/data/models/attendance/attendance_model.dart';
import 'package:vlr/data/models/attendance/employees_attendance_summary_model.dart';
import 'package:vlr/data/models/check_point_model.dart';
import 'package:vlr/data/models/employee_model.dart';
import 'package:vlr/data/models/pagination/pagination_state.dart';
import 'package:vlr/data/models/response/response_model.dart';
import 'package:vlr/data/repositories/attendence_repo.dart';

class AttendanceController extends GetxController implements GetxService {
  final AttendanceRepo attendanceRepo;

  AttendanceController({required this.attendanceRepo});

  bool isLoading = false;

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
        log("message : attendanceModel ${attendanceModel?.checkIn}");

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

  List<AttendanceModel> attendanceList = [];
  EmployeesAttendanceSummaryModel? employeesAttendanceSummaryModel;
  EmployeesModel? employeesModel;

  Future<ResponseModel> fetchAttendanceHistory() async {
    log('----------- fetchTodayAttendance Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic>? data = {
        "month": selectedMonth.month.toString(),
        "year": selectedMonth.year.toString(),
      };
      log("month : ${selectedMonth.month}, year : ${selectedMonth.year} ");

      Response response =
          await attendanceRepo.fetchAttendanceHistory(data: data);

      log("Status Code : ${response.statusCode}");
      log("Body        : ${response.body}");
      log("Body String : ${response.bodyString}");
      log("Status Text : ${response.statusText}");

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchAttendanceHistory successful",
        );

        final List data = response.body['data'];
        final summaryData = response.body['summary'];
        final employeeData = response.body['employee'];

        employeesModel = EmployeesModel.fromJson(employeeData);
        employeesAttendanceSummaryModel =
            EmployeesAttendanceSummaryModel.fromJson(summaryData);
        attendanceList = data.map((e) => AttendanceModel.fromJson(e)).toList();

        attendancePerCal(employeesAttendanceSummaryModel?.punchOut ?? 0);
      } else {
        String errorMessage = response.body['message'] ??
            "Error while fetchAttendanceHistory user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchAttendanceHistory(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchAttendanceHistory user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  double attendancePer = 0.0;

  void attendancePerCal(int presentDays) {
    final now = DateTime.now();

    final int totalDays = DateTime(now.year, now.month + 1, 0).day;

    attendancePer = (presentDays / totalDays) * 100;
    attendancePer = attendancePer / 100;
    log("attendancePer : $attendancePer");
    update();
  }

  DateTime selectedMonth = DateTime.now();

  List<EmployeesModel> employeesModelTodayAttendanceList = [];
  Future<ResponseModel> fetchTodayTeamAttendance({
    String status = "all status",
    bool isShowAllStatusData = true,
  }) async {
    log('----------- fetchTodayTeamAttendance Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      employeesAttendanceSummaryModel = null;
      employeesModelTodayAttendanceList.clear();

      Map<String, dynamic>? data = {
        "search": searchBarController.text,
        "status": isShowAllStatusData ? "all status" : status,
      };

      Response response =
          await attendanceRepo.fetchTodayTeamAttendance(data: data);

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchTodayTeamAttendance successful",
        );

        final List<dynamic> data = response.body['data'] ?? [];
        final summar = response.body['summary'] ?? [];

        employeesAttendanceSummaryModel =
            EmployeesAttendanceSummaryModel.fromJson(summar);

        employeesModelTodayAttendanceList = data
            .map((e) => EmployeesModel.fromJson(e as Map<String, dynamic>))
            .toList();

        log(
          "employeesModelTodayAttendanceList : ${employeesModelTodayAttendanceList.length}",
        );
      } else {
        String errorMessage = response.body['message'] ??
            "Error while fetchTodayTeamAttendance user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchTodayTeamAttendance(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchTodayTeamAttendance user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  final PaginationState<EmployeesModel> employeesModelState =
      PaginationState<EmployeesModel>();

  List<EmployeesModel> get employeesModelList => employeesModelState.items;

  Future<ResponseModel> fetchTeamEmployeesListPagination({
    bool loadMore = false,
    bool refresh = false,
  }) async {
    log('fetchTeamEmployeesList called '
        '(loadMore: $loadMore, refresh: $refresh)');

    Map<String, dynamic>? data = {
      "search": searchBarController.text,
    };
    ResponseModel responseModel = ResponseModel(false, "Unknown error");

    if (refresh) {
      employeesModelState.page = 1;
      employeesModelState.lastPage = 1;
      employeesModelState.items.clear();
      employeesModelState.dedupeIds.clear();
    }

    if (loadMore) {
      if (!employeesModelState.canLoadMore) {
        return ResponseModel(false, "No more pages");
      }
      employeesModelState.isMoreLoading = true;
      employeesModelState.page += 1;
    } else {
      employeesModelState.isInitialLoading = true;
      employeesModelState.page = 1;
      employeesModelState.items.clear();
      employeesModelState.dedupeIds.clear();
    }

    update();

    try {
      final Response response =
          await attendanceRepo.fetchTeamEmployeesList(data: data);

      // log("Raw response body: ${response.body}");

      if (response.statusCode != 200) {
        responseModel =
            ResponseModel(false, "Status code: ${response.statusCode}");
      } else if (response.body is Map<String, dynamic> &&
          response.body['status'] == "success") {
        final paginated = response.body['data'];

        if (paginated is Map<String, dynamic> && paginated['data'] is List) {
          final List itemsJson = paginated['data'] as List;

          final List<EmployeesModel> parsedData = itemsJson
              .map((e) => EmployeesModel.fromJson(e as Map<String, dynamic>))
              .toList();

          final int currentPage =
              int.tryParse(paginated['current_page'].toString()) ??
                  employeesModelState.page;
          final int lastPage =
              int.tryParse(paginated['last_page'].toString()) ?? currentPage;

          employeesModelState.lastPage = lastPage;
          employeesModelState.page = currentPage;

          if (loadMore) {
            for (final item in parsedData) {
              if (!employeesModelState.dedupeIds.contains(item.id)) {
                employeesModelState.dedupeIds.add(item.id);
                employeesModelState.items.add(item);
              }
            }
          } else {
            employeesModelState.items
              ..clear()
              ..addAll(parsedData);

            employeesModelState.dedupeIds
              ..clear()
              ..addAll(parsedData.map((e) => e.id));
          }

          log("Listing count: ${employeesModelState.items.length}");
          responseModel = ResponseModel(
            true,
            response.body['message'] ??
                "success searchFetchCategoriesListingPagination",
          );
        } else {
          responseModel =
              ResponseModel(false, "Invalid listing response format");
        }
      } else {
        responseModel = ResponseModel(
          false,
          response.body is Map<String, dynamic>
              ? (response.body['message'] ??
                  "Error while searchFetchCategoriesListingPagination")
              : "Invalid server response",
        );
      }
    } catch (e) {
      log('ERROR AT searchFetchCategoriesListingPagination(): $e');
      responseModel = ResponseModel(
          false, "Error while searchFetchCategoriesListingPagination $e");
    }

    employeesModelState.isInitialLoading = false;
    employeesModelState.isMoreLoading = false;
    update();
    return responseModel;
  }

  List<CheckPointModel> checkPointModelList = [];
  Future<ResponseModel> fetchCheckListPoint() async {
    log('----------- fetchCheckListPoint Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic>? data = {
        "mode": (attendanceModel?.isNotPunchIn ?? false)
            ? "punch_in"
            : (attendanceModel?.isPunchIn ?? false)
                ? "punch_out"
                : ""
      };
      Response response = await attendanceRepo.fetchCheckListPoint(data: data);

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchCheckListPoint successful",
        );
        final List data = response.body['data'];

        checkPointModelList =
            data.map((e) => CheckPointModel.fromJson(e)).toList();

        log("checkPointModelList : ${checkPointModelList.length}");
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while fetchCheckListPoint user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchCheckListPoint(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchCheckListPoint user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  void updateCheckListPoint({required int id}) {
    final index = checkPointModelList.indexWhere((e) => e.id == id);

    if (index != -1) {
      checkPointModelList[index].isChecked =
          !(checkPointModelList[index].isChecked ?? false);

      update();
    }
  }

  Future<ResponseModel> submitCheckListPoint() async {
    log('----------- submitCheckListPoint Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {
        "mode": (attendanceModel?.isNotPunchIn ?? false)
            ? "punch_in"
            : (attendanceModel?.isPunchIn ?? false)
                ? "punch_out"
                : "",
        "checklistAnswers":
            checkPointModelList.map((e) => e.toSubmitJson()).toList(),
      };
      Response response = await attendanceRepo.submitCheckListPoint(
        data: data,
      );

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "submitCheckListPoint successful",
        );
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while submitCheckListPoint user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT submitCheckListPoint(): $e');
      responseModel =
          ResponseModel(false, "Error while submitCheckListPoint user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  TextEditingController searchBarController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchBarController.dispose();
  }

  EmployeesModel? selectEmployeeModel;

  void updateSelectEmployeeModel({
    required EmployeesModel employeesModel,
  }) {
    selectEmployeeModel = employeesModel;
    update();
  }

  Future<ResponseModel> fetchTeamEmployeeAttendanceList() async {
    log('----------- fetchTeamEmployeeAttendanceList Called ----------');

    isLoading = true;
    update();

    try {
      attendanceList.clear();
      employeesAttendanceSummaryModel == null;
      employeesModel == null;

      final Map<String, dynamic> data = {
        "employee_id": selectEmployeeModel?.id.toString() ?? "",
        "month": selectedMonth.month.toString(),
        "year": selectedMonth.year.toString(),
      };

      final Response response =
          await attendanceRepo.fetchTeamEmployeeAttendanceList(data: data);

      if (response.body != null && response.body['status'] == "success") {
        final List<dynamic> list = response.body['data'] ?? [];
        final employee = response.body['employee'] ?? [];
        final summary = response.body['summary'] ?? [];

        employeesAttendanceSummaryModel =
            EmployeesAttendanceSummaryModel.fromJson(summary);

        employeesModel = EmployeesModel.fromJson(employee);

        attendanceList = list
            .map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
            .toList();

        isLoading = false;
        update();

        return ResponseModel(
          true,
          response.body['message'] ?? "Attendance fetched successfully",
        );
      }

      String errorMessage = response.body?['message'] ?? "Something went wrong";

      if (response.body?['errors'] != null) {
        final errors = response.body['errors'] as Map<String, dynamic>;
        if (errors.isNotEmpty) {
          errorMessage = (errors.values.first as List).first.toString();
        }
      }

      isLoading = false;
      update();

      return ResponseModel(false, errorMessage);
    } catch (e, stackTrace) {
      log("fetchTeamEmployeeAttendanceList Error: $e");
      log(stackTrace.toString());

      isLoading = false;
      update();

      return ResponseModel(
        false,
        "Failed to fetch attendance.",
      );
    }
  }

  int? attendanceId;

  void updateAttendanceId({required int attendanceId}) {
    this.attendanceId = attendanceId;
    update();
  }

  Future<ResponseModel> fetchAttendanceDetails() async {
    log('----------- fetchAttendanceDetails Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Response response = await attendanceRepo.fetchAttendanceDetails(
        attendanceId: attendanceId ?? 0,
      );

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchAttendanceDetails successful",
        );
        attendanceModel = AttendanceModel.fromJson(response.body['data']);
      } else {
        String errorMessage = response.body['message'] ??
            "Error while fetchAttendanceDetails user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchAttendanceDetails(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchAttendanceDetails user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }
}
