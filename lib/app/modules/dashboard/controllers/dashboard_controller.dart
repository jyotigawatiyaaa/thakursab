import 'dart:convert';
import 'dart:developer';

import 'package:fdis_mobile/app/component/error_helper.dart';
import 'package:fdis_mobile/app/constant.dart';
import 'package:fdis_mobile/app/data/user_model.dart';
import 'package:fdis_mobile/app/endpoints.dart';
import 'package:fdis_mobile/app/modules/audits/model/all_audit_response.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/tabs/audit_tab.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/tabs/help_tab.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/tabs/setting_tab.dart';
import 'package:fdis_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:fdis_mobile/app/resources/local_resources.dart';
import 'package:fdis_mobile/app/resources/local_resoureces_key.dart';
import 'package:fdis_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController extends GetxController {
  final tabIndex = 0.obs;
  var user = UserModel().obs;
  AllAuditResponse? allAuditResponse;

  late TabController tabController;
  final tabList = [
    const AuditTab(),
    const SettingTab(),
    const HelpTab()
  ]; // HelpTab()];

  launchURLApp() async {
    const url = 'https://flutterdevs.com/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onClose() {}

  @override
  void onInit() {
    // user.value = LocalResourceManagement.readUser();
    super.onInit();
    TOKEN = LocalResourceManagement.getString(key: LocalKeys.kToken) ?? '';
  }

  logout() {
    ErrorHelper.showCustomDialog(
        title: "Logout",
        message: "Are you Sure.. ?",
        onYes: () {
          LocalResourceManagement.logout();
          Get.offAllNamed(Routes.kLogin);
        });
  }

  Future<List<AllAuditList>?> allAuditListAPI() async {
   try{
     List<AllAuditList> lst = [];
     lst.clear();
     print(TOKEN);
     var header = {'x-access-token': TOKEN};
     var response = await baseClient.get(Endpoints.getAllAudit, headerData: header);
     print(response);
     final item = json.decode(response.body);
     allAuditResponse = AllAuditResponse.fromJson(item);
     if(allAuditResponse!.serverCode==200){
       lst = allAuditResponse!.allAuditList!;
     }
     return lst;
   }catch(e){
     print(e);
     throw Exception("An error occured");
   }
  }
}
