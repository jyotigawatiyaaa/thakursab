import 'dart:convert';
import 'dart:developer';
import 'package:fdis_mobile/app/component/custom_snack_bar.dart';
import 'package:fdis_mobile/app/constant.dart';
import 'package:fdis_mobile/app/data/user_model.dart';
import 'package:fdis_mobile/app/endpoints.dart';
import 'package:fdis_mobile/app/modules/login/model/login_model.dart';
import 'package:fdis_mobile/app/resources/local_resources.dart';
import 'package:fdis_mobile/app/resources/local_resoureces_key.dart';
import 'package:fdis_mobile/app/service/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

BaseClient baseClient = BaseClient();

class LoginController extends GetxController {
  final count = 0.obs;
  var userModel = UserModel().obs;
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  LoginResponse? loginResponse;
  RxBool isLoading = false.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  Future<LoginResponse?> login(BuildContext context) async {
    RxBool check = false.obs;
    isLoading.value = true;
    log(isLoading.value.toString());
    try {
      var body = {
        "username": userNameController.text,
        "password": passWordController.text
      };
      var header = {
        "Content-Type": 'application/json',
      };
      log(body.toString());
      http.Response? response = await baseClient.post(Endpoints.login, body: body,headers: header);
      log('response ${response!.body}');
      final item = json.decode(response.body);
      loginResponse = LoginResponse.fromJson(item);
      if (response.statusCode == 200) {
         LocalResourceManagement.saveLogin(user: json.encode(loginResponse));
        LocalResourceManagement.saveString(
            key: LocalKeys.kToken, value: loginResponse!.loginData!.token!);
         TOKEN = loginResponse!.loginData!.token!;
        if (loginResponse!.serverCode == 200) {
          isLoading.value = false;
          check.value = true;
        } else {
          check.value = false;
          isLoading.value = false;
        }
      } else {
        check.value = false;
        isLoading.value = false;
      }
    } on Exception catch (e) {
      isLoading.value = false;
      CustomSnackBar.showSnackBar(
          value:e.toString(), context: context);
      log(e.toString());
    }
    return loginResponse;
  }
}
