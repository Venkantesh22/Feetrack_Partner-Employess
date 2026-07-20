import 'dart:developer';

import 'package:get/get.dart';
import 'package:vlr/data/models/notice_model.dart';
import 'package:vlr/data/models/response/response_model.dart';
import 'package:vlr/data/repositories/notice_repo.dart';

class NoticeController extends GetxController implements GetxService {
  final NoticeRepo noticeRepo;

  NoticeController({required this.noticeRepo});

  bool isLoading = false;

  List<NoticeModel> noticeModelList = [];
  Future<ResponseModel> fetchNoticeBoard() async {
    log('----------- fetchNoticeBoard Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Response response = await noticeRepo.fetchNoticeBoard();

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchNoticeBoard successful",
        );

        noticeModelList =
            response.body['data'].map((e) => NoticeModel.fromJson(e)).toList();
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while fetchNoticeBoard user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchNoticeBoard(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchNoticeBoard user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  NoticeModel? noticeModel;
  Future<ResponseModel> fetchNoticeBoardById({required int id}) async {
    log('----------- fetchNoticeBoardById Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Response response = await noticeRepo.fetchNoticeBoardById(id: id);

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "fetchNoticeBoardById successful",
        );

        noticeModel = NoticeModel.fromJson(response.body['data']);
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while fetchNoticeBoardById user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }

        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT fetchNoticeBoardById(): $e');
      responseModel =
          ResponseModel(false, "Error while fetchNoticeBoardById user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }
}
