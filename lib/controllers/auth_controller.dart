import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vlr/data/models/response/response_model.dart';

import '../data/models/response/user_model.dart';
import '../data/repositories/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool isLoading = false;
  bool _acceptTerms = false;

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  bool get acceptTerms => _acceptTerms;

  TextEditingController emailController =
      TextEditingController(text: "venkatesh242002@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "123456");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "123456");
  TextEditingController fullNameController =
      TextEditingController(text: "Venkatesh Rathod");
  TextEditingController mobileController =
      TextEditingController(text: "7972391849");

  @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.clear();
    mobileController.clear();
  }

  Future<ResponseModel> registerUser() async {
    log('----------- registerUser Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {
        "mobile": mobileController.text.trim(),
        "name": mobileController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "password_confirmation": confirmPasswordController.text.trim(),
      };

      Response response = await authRepo.postUserRegister(
        data: FormData(data),
      );

      log("Raw Response: ${response.body}");

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
            true, response.body['message'] ?? "success registerUser ");
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while registering user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;

          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }
        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT registerUser(): $e');
      responseModel = ResponseModel(false, "Error while registering user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  void toggleTerms() {
    _acceptTerms = !_acceptTerms;
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }
}
