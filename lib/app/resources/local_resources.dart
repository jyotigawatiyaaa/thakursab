import 'dart:developer';

import 'package:fdis_mobile/app/data/user_model.dart';
import 'package:get_storage/get_storage.dart';

import 'local_resoureces_key.dart';

class LocalResourceManagement {
  static saveLogin({required String user}) {
    final box = GetStorage();
    box.write(LocalKeys.kLogin, true);
    box.write(LocalKeys.kUser, user);
    log("Logging Saved ========");
  }

  static saveString({required String key,required String value}){
    final box = GetStorage();
    box.write(key, value);
  }

  static String? getString({required String key}){
    final box = GetStorage();
    return box.read<String>(key);
  }

  static bool? readLogin() {
    final box = GetStorage();
    return box.read<bool>(LocalKeys.kLogin);
  }

  static UserModel readUser() {
    final box = GetStorage();
    return UserModel.fromJson(box.read(LocalKeys.kUser));
  }

  static logout() {
    final box = GetStorage();
    box.remove(LocalKeys.kLogin);
  }
}
