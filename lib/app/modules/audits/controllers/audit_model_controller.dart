import 'dart:convert';

import 'package:fdis_mobile/app/endpoints.dart';
import 'package:fdis_mobile/app/modules/audits/model/audit_model.dart';
import 'package:fdis_mobile/app/service/base_client.dart';
import 'package:get/get.dart';

class AuditModelController extends GetxController {
  var companyList = List<Rows>.empty(growable: true).obs;
  var isLoading = false.obs;
  AllCompanyResponse? allCompanyResponse;
  var argumentData;

  void getCompany(String id) async {
    final response =
        await baseClient.get(Endpoints.getAllCompany+id);
    final item = json.decode(response.body);
    allCompanyResponse = AllCompanyResponse.fromJson(item);
    if (allCompanyResponse != null) {
      companyList.value = allCompanyResponse!.companyList!.rows ?? [];
      isLoading.value = false;
    }
  }

  BaseClient baseClient = BaseClient();

  @override
  void onInit() {
    argumentData = Get.arguments;
    isLoading.value = true;
    getCompany(argumentData[0]);
    super.onInit();
  }
}
