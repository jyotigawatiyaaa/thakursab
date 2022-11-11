import 'package:fdis_mobile/app/colors.dart';
import 'package:fdis_mobile/app/component/custom_elevated_button.dart';
import 'package:fdis_mobile/app/component/custom_widgets.dart';
import 'package:fdis_mobile/app/component/shadow_bg_container.dart';
import 'package:fdis_mobile/app/constant.dart';
import 'package:fdis_mobile/app/lang/lang.dart';
import 'package:fdis_mobile/app/modules/formulier/controller/formulier_view_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulierDetailView extends GetView<FormulierViewController> {
  FormulierDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomWidgets.customAppbar(
        "Toon Formulier",
        actions: [],
        leading: BackButton(
          onPressed: () => Get.back(),
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 30, vertical: size.width / 30),
          child: Column(
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: KLabelDropDownColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Lang.hintAntalFounten,
                        style: const TextStyle(fontSize: 24),
                      ),
                      kHorizontalSmallSizedBox,
                      Column(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                            ),
                            onTap: () => controller.increment(),
                          ),
                          Obx(() => Text(controller.anatalFouten.toString())),
                          GestureDetector(
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            onTap: () => controller.decrement(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              kVerticalSmallSizedBox,
              kVerticalSmallSizedBox,
              // CustomDropDown(
              //   value: controller.dropDownValues[0],
              //   dropDownValues: controller.dropDownValues,
              //   hint: Lang.hintElement,
              //   onChanged: (newValue) {
              //     controller.dropdownValue.value = newValue.toString();
              //   },
              // ),
              // kVerticalSmallSizedBox,
              // kVerticalSmallSizedBox,
              // CustomDropDown(
              //   value: controller.dropDownValues[0],
              //   dropDownValues: controller.dropDownValues,
              //   hint: Lang.hintSoort,
              //   onChanged: (newValue) {
              //     controller.dropdownValue.value = newValue.toString();
              //   },
              // ),
              kVerticalSmallSizedBox,
              kVerticalSmallSizedBox,
              Container(
                decoration: BoxDecoration(
                  color: kLabelBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 30, vertical: size.width / 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Lang.signatureText),
                          IconButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) return;

                                PlatformFile? file = result.files.first;
                                // OpenFile.open(file.path);
                              },
                              icon: const Icon(Icons.upload))
                        ],
                      ),
                      SizedBox(height: size.width / 10, child: TextFormField())
                    ],
                  ),
                ),
              ),
              kVerticalSmallSizedBox,
              kVerticalSmallSizedBox,
              Container(
                decoration: BoxDecoration(
                  color: kLabelBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 30, vertical: size.width / 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Lang.signatureText1),
                          IconButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) return;

                                PlatformFile? file = result.files.first;
                                // OpenFile.open(file.path);
                              },
                              icon: const Icon(Icons.upload))
                        ],
                      ),
                      SizedBox(height: size.width / 10, child: TextFormField())
                    ],
                  ),
                ),
              ),
              kVerticalSmallSizedBox,
              kVerticalSmallSizedBox,
              ShadowBgContainer(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomElevatedButton(text: "Save", ontap: () {}),
                  CustomElevatedButton(text: "Cancel", ontap: () {}),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
