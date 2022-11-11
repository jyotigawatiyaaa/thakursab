import 'dart:convert';
import 'dart:developer';

import 'package:fdis_mobile/app/endpoints.dart';
import 'package:fdis_mobile/app/modules/formulier/models/area_by_category_id.dart';
import 'package:fdis_mobile/app/modules/formulier/models/category_model.dart';
import 'package:fdis_mobile/app/modules/formulier/models/floor_model.dart';
import 'package:fdis_mobile/app/service/base_client.dart';
import 'package:get/get.dart';

class FormulierViewController extends GetxController {
  var antallFounternValue = 0.obs;
  var anatalFouten = 0.obs;
  CategoryByIdResponse? categoryModel;
  FloorModel? floorModel;
  AreaByCategoryIdModel? areaByCategoryIdModel;

  CategoryData? currentCategoryValue;
  RxString currentFloorValue = ''.obs;
  var argumentData;
  String? categoryValue;
  String? floorValue;


  decreamentAntall() {
    if (antallFounternValue.value > 1) {
      antallFounternValue.value -= 1;
    }
  }

  increamentAntall() {
    antallFounternValue.value += 1;
  }

  onSave() {
    //reset the value
    antallFounternValue.value = 1;
  }

  @override
  void dispose() {
    antallFounternValue.close();
    super.dispose();
  }

  void increment() {
    anatalFouten += 1;
  }

  void decrement() {
    if (anatalFouten > 0) {
      anatalFouten -= 1;
    }
  }

  Future<List<CategoryData>?> getCategoryById() async {
    log('enter' + Endpoints.category + argumentData[0]);
    List<CategoryData> lst = [];
    final response =
        await BaseClient().get(Endpoints.category + argumentData[1]);
    final item = json.decode(response.body);
    log("category " + item.toString());
    categoryModel = CategoryByIdResponse.fromJson(item);
    if (categoryModel!.serverCode == 200) {
      lst = categoryModel!.data!;
    }
    return lst;
  }

  Future<List<FloorData>> getFloor() async {
    List<FloorData> lst = [];
    final response = await BaseClient().get(Endpoints.floor);
    log("HHHHHHHHHHHHHHHH${response.body.toString()}");
    final item = json.decode(response.body);
    floorModel = FloorModel.fromJson(item);
    if (floorModel!.serverCode == 200) {
      lst = floorModel!.data!.floorData!;
    }
    return lst;
  }

  Future<List<AreaByCatData>> getArea(String categoryId) async {
    log('enter area');
    List<AreaByCatData> lst = [];
    final response = await BaseClient().get(Endpoints.area+categoryId);
    log(response.body.toString());
    final item = json.decode(response.body);
    areaByCategoryIdModel = AreaByCategoryIdModel.fromJson(item);
    if (areaByCategoryIdModel!.serverCode == 200) {
      lst = areaByCategoryIdModel!.data!;
    }
    return lst;
  }

  BaseClient baseClient = BaseClient();

  @override
  void onInit() {
    argumentData = Get.arguments;
    super.onInit();
  }
}
