import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlr/data/models/attendance_model.dart';
import 'package:vlr/data/models/check_point_model.dart';
import 'package:vlr/data/models/pagination/pagination_state.dart';
import 'package:vlr/data/models/response/response_model.dart';
import 'package:vlr/data/repositories/attendence_repo.dart';

class AttendanceController extends GetxController implements GetxService {
  final AttendanceRepo attendanceRepo;

  AttendanceController({required this.attendanceRepo});

  bool isLoading = false;

  EmployeesStatus employeesStatus = EmployeesStatus.notPunchIn;

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

  final PaginationState<AttendanceModel> attendanceState =
      PaginationState<AttendanceModel>();

  List<AttendanceModel> get attendanceList => attendanceState.items;

  Future<ResponseModel> fetchAttendanceHistoryPagination({
    bool loadMore = false,
    bool refresh = false,
  }) async {
    log('searchFetchCategoriesListingPagination called '
        '(loadMore: $loadMore, refresh: $refresh)');

    ResponseModel responseModel = ResponseModel(false, "Unknown error");

    if (refresh) {
      attendanceState.page = 1;
      attendanceState.lastPage = 1;
      attendanceState.items.clear();
      attendanceState.dedupeIds.clear();
    }

    if (loadMore) {
      if (!attendanceState.canLoadMore) {
        return ResponseModel(false, "No more pages");
      }
      attendanceState.isMoreLoading = true;
      attendanceState.page += 1;
    } else {
      attendanceState.isInitialLoading = true;
      attendanceState.page = 1;
      attendanceState.items.clear();
      attendanceState.dedupeIds.clear();
    }

    update();

    try {
      final Response response = await attendanceRepo.fetchAttendanceHistory();

      // log("Raw response body: ${response.body}");

      if (response.statusCode != 200) {
        responseModel =
            ResponseModel(false, "Status code: ${response.statusCode}");
      } else if (response.body is Map<String, dynamic> &&
          response.body['status'] == "success") {
        final paginated = response.body['data'];

        if (paginated is Map<String, dynamic> && paginated['data'] is List) {
          final List itemsJson = paginated['data'] as List;

          final List<AttendanceModel> parsedData = itemsJson
              .map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
              .toList();

          final int currentPage =
              int.tryParse(paginated['current_page'].toString()) ??
                  attendanceState.page;
          final int lastPage =
              int.tryParse(paginated['last_page'].toString()) ?? currentPage;

          attendanceState.lastPage = lastPage;
          attendanceState.page = currentPage;

          if (loadMore) {
            for (final item in parsedData) {
              if (!attendanceState.dedupeIds.contains(item.id)) {
                attendanceState.dedupeIds.add(item.id);
                attendanceState.items.add(item);
              }
            }
          } else {
            attendanceState.items
              ..clear()
              ..addAll(parsedData);

            attendanceState.dedupeIds
              ..clear()
              ..addAll(parsedData.map((e) => e.id));
          }

          log("Listing count: ${attendanceState.items.length}");
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

    attendanceState.isInitialLoading = false;
    attendanceState.isMoreLoading = false;
    update();
    return responseModel;
  }

  DateTime selectedMonth = DateTime.now();

  Future<ResponseModel> fetchTodayTeamAttendance() async {
    log('----------- fetchTodayTeamAttendance Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Response response = await attendanceRepo.fetchTodayTeamAttendance();

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchTodayTeamAttendance successful",
        );

        attendanceModel = AttendanceModel.fromJson(response.body['data']);
        log("message : attendanceModel ${attendanceModel?.checkIn}");

        // employeesStatus = attendanceModel.status ;
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

  Future<ResponseModel> fetchTeamAttendanceHistory() async {
    log('----------- fetchTeamAttendanceHistory Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Response response = await attendanceRepo.fetchTeamAttendanceHistory();

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchTeamAttendanceHistory successful",
        );

        attendanceModel = AttendanceModel.fromJson(response.body['data']);
        log("message : attendanceModel ${attendanceModel?.checkIn}");

        // employeesStatus = attendanceModel.status ;
      } else {
        String errorMessage = response.body['message'] ??
            "Error while fetchTeamAttendanceHistory user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchTeamAttendanceHistory(): $e');
      responseModel = ResponseModel(
          false, "Error while fetchTeamAttendanceHistory user $e");
    }

    isLoading = false;
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
      Map<String, dynamic>? data = {"mode": "punch_in"};
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
      checkPointModelList[index].isCheck =
          !(checkPointModelList[index].isCheck ?? false);

      update();
    }
  }

  Future<ResponseModel> submitCheckListPoint() async {
    log('----------- submitCheckListPoint Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic>? data = {
        "mode": " punch_out",
        "checklistAnswers": checkPointModelList
      };
      Response response = await attendanceRepo.submitCheckListPoint(
        data: FormData(data),
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
}
