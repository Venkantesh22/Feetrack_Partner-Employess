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
      TextEditingController(text: "venkatesh2420023@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Ven12345678");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "Ven12345678");
  TextEditingController fullNameController =
      TextEditingController(text: "Venkatesh Rathod");
  TextEditingController mobileController =
      TextEditingController(text: "7972391843");

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

      //log("Raw Response: ${response.body}");

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "registerUser successful",
        );

        final token = response.body['data']?['token'];

        if (token != null && token.toString().isNotEmpty) {
          await authRepo.setUserToken(token);

          log("Saved Token: $token");
        }
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

  Future<ResponseModel> postUserLogin() async {
    log('----------- postUserLogin Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      Response response = await authRepo.postUserLogin(
        data: FormData(data),
      );

      //  log("Raw Response: ${response.body}");

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "Login successful",
        );

        final token = response.body['data']?['token'];

        if (token != null && token.toString().isNotEmpty) {
          await authRepo.setUserToken(token);

          log("Saved Token: $token");
        }
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while postUserLogin user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;

          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }
        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT postUserLogin(): $e');
      responseModel = ResponseModel(false, "Error while postUserLogin user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> updateFCMToken() async {
    log('----------- updateFCMToken Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {"fcm_token": authRepo.getFCMToken()};

      Response response = await authRepo.updateFCMToken(
        data: FormData(data),
      );

      //  log("Raw Response: ${response.body}");

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "update fcm token successful",
        );
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while update fcm token user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;

          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }
        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT update fcm token(): $e');
      responseModel =
          ResponseModel(false, "Error while update fcm token user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> logOutPost() async {
    log('----------- logOutPost Called ----------');

    ResponseModel responseModel;
    isLoading = true;
    update();

    try {
      Map<String, dynamic> data = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      Response response = await authRepo.logOut(
        data: FormData(data),
      );

      if (response.body['status'] == "success") {
        responseModel = ResponseModel(
          true,
          response.body['message'] ?? "logOut successful",
        );
      } else {
        String errorMessage =
            response.body['message'] ?? "Error while logOutPost user";

        if (response.body['errors'] != null) {
          final errors = response.body['errors'] as Map<String, dynamic>;

          if (errors.isNotEmpty) {
            errorMessage = (errors.values.first as List).first.toString();
          }
        }
        responseModel = ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('ERROR AT logOutPost): $e');
      responseModel = ResponseModel(false, "Error while logOutPost user $e");
    }

    isLoading = false;
    update();
    return responseModel;
  }

  Future<void> saveFMCToken(String fcmToken) async {
    final saveFCMToken = await authRepo.saveFCMToken(fcmToken: fcmToken);
    log('loginUser: saved FCM token: $saveFCMToken');
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
