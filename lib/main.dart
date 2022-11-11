import 'package:fdis_mobile/app/constant.dart';
import 'package:fdis_mobile/app/resources/local_resoureces_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/resources/local_resources.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: LocalResourceManagement.readLogin() ?? false
          ? Routes.kDashboard
          : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
