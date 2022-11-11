import 'dart:developer';

import 'package:fdis_mobile/app/colors.dart';
import 'package:fdis_mobile/app/component/custom_widgets.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/components/info_box.dart';
import 'package:fdis_mobile/app/modules/formulier/controller/formulier_view_controller.dart';
import 'package:fdis_mobile/app/modules/formulier/models/area_by_category_id.dart';
import 'package:fdis_mobile/app/modules/formulier/models/category_model.dart';
import 'package:fdis_mobile/app/modules/formulier/models/floor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant.dart';

class FormulierView extends StatefulWidget {
  FormulierView({Key? key}) : super(key: key);

  @override
  State<FormulierView> createState() => _FormulierViewState();
}

class _FormulierViewState extends State<FormulierView> {
  late final Future<List<CategoryData>?> myFuture;
  late final Future<List<FloorData>?> floorFuture;
  List<AreaByCatData> areaList = [];
  String? areaValue;

  FormulierViewController controller = Get.put(FormulierViewController());

  @override
  void initState() {
    super.initState();
    myFuture = controller.getCategoryById();
    floorFuture = controller.getFloor();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomWidgets.customAppbar("Toon Formulier",
          actions: [],
          leading: BackButton(
            onPressed: () => Get.back(),
            color: Colors.blue,
          )),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kMediumVerticalSizeBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonContainer('Test Company', color: Colors.white),
                  kHorizontalSmallSizedBox,
                  const InfoBox(
                    heading: "CODE",
                    value: "10941",
                  ),
                ],
              ),
              kMediumVerticalSizeBox,
              SizedBox(
                height: 60,
                width: Get.width,
                child: FutureBuilder<List<CategoryData>?>(
                    future: myFuture,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        case ConnectionState.done:
                        default:
                          if (snapshot.hasData) {
                            return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: kLabelBgColor,
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(8),
                                    dropdownColor: kLabelBgColor,
                                    onChanged: (String? val) {
                                      areaList.clear();
                                      areaValue = null;
                                      controller.categoryValue = val!;
                                      controller.getArea(val).then((value) {
                                        if (value.isNotEmpty) {
                                          areaList = value;
                                          log(areaList.toString());
                                          setState(() {});
                                        }
                                      });
                                      setState(() {});
                                    },
                                    hint: const Text(
                                      'Categorieen',
                                      style: kLabelFourmTextStyle,
                                    ),
                                    isExpanded: true,
                                    value: controller.categoryValue,
                                    items: snapshot.data!
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.categoryId,
                                            child: Text(
                                              e.categoryName.toString(),
                                              style: kLabelFourmTextStyle,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const SizedBox.shrink();
                          } else {
                            return const SizedBox.shrink();
                          }
                      }
                    }),
              ),
              kMediumVerticalSizeBox,
              SizedBox(
                height: 60,
                width: Get.width,
                child: FutureBuilder<List<FloorData>?>(
                    future: floorFuture,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        case ConnectionState.done:
                        default:
                          if (snapshot.hasData) {
                            return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: kLabelBgColor,
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(8),
                                    dropdownColor: kLabelBgColor,
                                    onChanged: (String? val) {
                                      controller.floorValue = val!;
                                      setState(() {});
                                    },
                                    hint: const Text(
                                      'VERDIEPING',
                                      style: kLabelFourmTextStyle,
                                    ),
                                    isExpanded: true,
                                    value: controller.floorValue,
                                    items: snapshot.data!
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e.floorName,
                                            child: Text(
                                              e.floorName.toString(),
                                              style: kLabelFourmTextStyle,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const SizedBox.shrink();
                          } else {
                            return const SizedBox.shrink();
                          }
                      }
                    }),
              ),
              kMediumVerticalSizeBox,
              areaList.isEmpty
                  ? const SizedBox.shrink()
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: kLabelBgColor,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<dynamic>(
                            borderRadius: BorderRadius.circular(8),
                            dropdownColor: kLabelBgColor,
                            onChanged: (dynamic val) {
                              areaValue = val!;
                              setState(() {});
                            },
                            hint: const Text(
                              'RUIMTE OMSCHRIJVING',
                              style: kLabelFourmTextStyle,
                            ),
                            isExpanded: true,
                            value: areaValue,
                            items: areaList
                                .map(
                                  (e) => DropdownMenuItem<dynamic>(
                                    value: e.name,
                                    child: Text(
                                      e.name ?? '',
                                      style: kLabelFourmTextStyle,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
              kMediumVerticalSizeBox,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: kLabelBgColor,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text('RUIMTENUMBER',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kLabelTextColor,
                              fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: kLabelBgColor,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text('99',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kLabelTextColor,
                              fontSize: 18)),
                    ),
                  ),
                ],
              ),
              kMediumVerticalSizeBox,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: kLabelBgColor,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text('TEL - ELEMENT',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kLabelTextColor,
                              fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: kLabelBgColor,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text('99',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kLabelTextColor,
                              fontSize: 18)),
                    ),
                  ),
                ],
              )

              //     CustomLabelBgWidget(
              //     child:
              //     CustomDropDown(
              //         lst: controller.categoryList.value,
              //         value: controller.currentCategoryValue,
              //         hint: 'Category',
              //         onChanged: (CategoryData? value) {}),
              //     Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 5),
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey),
              //         borderRadius: BorderRadius.circular(10)
              //       ),
              //       child: DropdownButtonHideUnderline(
              //         child: DropdownButton<dynamic>(
              //           borderRadius: BorderRadius.circular(8),
              //           dropdownColor: kLabelBgColor,
              //           onChanged: (newValue) {
              //             controller.currentCategoryValue.value = newValue!;
              //             log("category value $newValue");
              //           },
              //           hint: Text(
              //             Lang.labelCategory,
              //             style: kLabelFourmTextStyle,
              //           ),
              //           isExpanded: true,
              //           value: controller.currentCategoryValue.value,
              //           items: controller.categoryList.value.isEmpty
              //               ? []
              //               : controller.categoryList.value
              //               .map(
              //                 (e) => DropdownMenuItem<dynamic>(
              //               value: e.categoryName,
              //               child: Text(
              //                 e.categoryName!,
              //                 style: kLabelFourmTextStyle,
              //               ),
              //             ),
              //           )
              //               .toList(),
              //         ),
              //       ),
              //     ),
              //
              //     kMediumVerticalSizeBox,
              //
              //     // Container(
              //     //   padding: const EdgeInsets.symmetric(horizontal: 5),
              //     //   decoration: BoxDecoration(
              //     //       border: Border.all(color: Colors.grey),
              //     //       borderRadius: BorderRadius.circular(10)
              //     //   ),
              //     //   child: DropdownButtonHideUnderline(
              //     //     child: DropdownButton<dynamic>(
              //     //       borderRadius: BorderRadius.circular(8),
              //     //       dropdownColor: kLabelBgColor,
              //     //       onChanged: (newValue) {
              //     //         controller.currentFloorValue.value = newValue!;
              //     //         log("category value $newValue");
              //     //       },
              //     //       hint: Text(
              //     //         Lang.hintVerdiping,
              //     //         style: kDropHintStyle,
              //     //       ),
              //     //       isExpanded: true,
              //     //       value: controller.currentFloorValue.value,
              //     //       items: controller.floorList.value.isEmpty
              //     //           ? []
              //     //           : controller.floorList.value
              //     //           .map(
              //     //             (e) => DropdownMenuItem<dynamic>(
              //     //           value: e.floorName,
              //     //           child: Text(
              //     //             e.floorName!,
              //     //             style: kLabelFourmTextStyle,
              //     //           ),
              //     //         ),
              //     //       )
              //     //           .toList(),
              //     //     ),
              //     //   ),
              //     // ),
              //
              //     kVerticalSmallSizedBox,
              //
              //     kMediumVerticalSizeBox,
              //     // (controller.dropDownValues.isEmpty ||
              //     //         controller.dropDownValues == null)
              //     //     ? const SizedBox.shrink()
              //     //     : CustomDropDown(
              //     //         value: controller.categoryList[0],
              //     //         dropDownValues: controller.categoryList.value,
              //     //         hint: Lang.hintRuimte,
              //     //         onChanged: (newValue) {
              //     //           print("Hello");
              //     //           //controller.dropdownValue.value = newValue.toString();
              //     //         },
              //     //       ),
              //
              //     kMediumVerticalSizeBox,
              //     kMediumVerticalSizeBox,
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         CustomLabelBgWidget(
              //           child: Padding(
              //             padding:
              //                 EdgeInsets.symmetric(horizontal: size.width / 20),
              //             child: Text(Lang.hintRumitNumber,
              //                 style: kLabelFourmTextStyle),
              //           ),
              //         ),
              //         SizedBox(
              //           width: size.width / 20,
              //         ),
              //         const CustomInputTextForNumber(),
              //       ],
              //     ),
              //     kMediumVerticalSizeBox,
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         CustomLabelBgWidget(
              //           child: Padding(
              //             padding:
              //                 EdgeInsets.symmetric(horizontal: size.width / 20),
              //             child:
              //                 Text(Lang.hintTelElment, style: kLabelFourmTextStyle),
              //           ),
              //         ),
              //         SizedBox(
              //           width: size.width / 20,
              //         ),
              //         const CustomInputTextForNumber(),
              //       ],
              //     ),
              //     kMediumVerticalSizeBox,
              //     kMediumVerticalSizeBox,
              //     ShadowBgContainer(
              //       child: Center(
              //         child: CustomElevatedButton(
              //           ontap: () {
              //             Get.toNamed(Routes.kFormulierDetailsView);
              //           },
              //           text: Lang.formulierenButton.toUpperCase(),
              //         ),
              //       ),
              //     )
            ],
          ),
        ),
      ),
    );
  }

  Widget commonContainer(String value, {Color? color}) {
    return Container(
      height: 55,
      width: Get.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kLabelBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          value,
          style: kLargeHeadingTextStyle.copyWith(
              color: color, fontSize: Get.width * 0.055),
        ),
      ),
    );
  }
}
