import 'dart:convert';
import 'dart:developer';

import 'package:fdis_mobile/app/modules/audits/model/company_detail_response.dart';
import 'package:fdis_mobile/app/modules/formulier/views/formulier_view.dart';
import 'package:fdis_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:fdis_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SingleAuditController extends GetxController {
  final count = 0.obs;
  var argumentData;
  var isLoading = false.obs;
  CompanyDetailResponse? companyDetailResponse;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
    argumentData = Get.arguments;
   // getDetailCompanyById();
  }

  Future<CompanyDetailResponse> getDetailCompanyById() async {
    try {

      var response = await baseClient.get('/dashboard/Mob/companyDetail?AuditId=${argumentData[0]}&clientId=${argumentData[1]}');
      print(argumentData[1]);
      final item = json.decode(response.body);
      companyDetailResponse = CompanyDetailResponse.fromJson(item);
      if (companyDetailResponse != null) {
        isLoading.value = false;
      }
    } on Exception catch (e) {
      isLoading.value = false;
    }
    return companyDetailResponse!;
  }

  navigateToAuditFormulier() {
    Get.to(() => FormulierView(),arguments: argumentData);
   // Get.to(FormulierView(),arguments: argumentData);
  }
}
