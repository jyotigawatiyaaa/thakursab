import 'package:fdis_mobile/app/component/custom_elevated_button.dart';
import 'package:fdis_mobile/app/component/custom_signature.dart';
import 'package:fdis_mobile/app/component/custom_widgets.dart';
import 'package:fdis_mobile/app/component/shadow_bg_container.dart';
import 'package:fdis_mobile/app/lang/lang.dart';
import 'package:fdis_mobile/app/modules/audits/controllers/single_audit_controller.dart';
import 'package:fdis_mobile/app/modules/audits/model/company_detail_response.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/components/info_box.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../colors.dart';
import '../../../constant.dart';

class SingleAuditForm extends GetView<SingleAuditController> {
  const SingleAuditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomWidgets.customAppbar("Toon Audit",
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Signature",
                    content: SignaturePage(),
                    // textConfirm: "Upload",
                    // confirmTextColor: Colors.white
                  );
                },
                icon: const Icon(
                  Icons.upload,
                  color: Colors.blue,
                )),
          ],
          leading: BackButton(
            color: Colors.blue,
            onPressed: () => Get.back(),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<CompanyDetailResponse>(
                  future: controller.getDetailCompanyById(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return SizedBox(
                            height: Get.height,
                            width: Get.width,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      case ConnectionState.done:
                      default:
                        if (snapshot.hasData) {
                          var companydetailResponse=snapshot.data;
                          if(companydetailResponse!.companyDetailList!.isNotEmpty){
                            return Column(
                                children: [
                                  kVerticalSmallSizedBox,
                                  CustomLabel(
                                      label: controller
                                          .companyDetailResponse!
                                          .companyDetailList!
                                          .first
                                          .locationName ??
                                          "",
                                      widthDivision: 2,
                                      textStyle: kLargeHeadingTextStyle.copyWith(
                                          fontSize: size.width * 0.055)),
                                  kVerticalSmallSizedBox,
                                  kVerticalSmallSizedBox,
                                  CustomLabel(
                                      label: Lang.labelInformation,
                                      widthDivision: 1,
                                      textStyle: TextStyle(
                                          color: kLabelTextColor,
                                          fontSize: size.width * 0.05)),
                                  kVerticalSmallSizedBox,
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InfoBox(
                                          heading: "Code",
                                          value: controller
                                              .companyDetailResponse!
                                              .companyDetailList!
                                              .first
                                              .auditCode ??
                                              "",
                                        ),
                                        const SizedBox(width: 5),
                                        InfoBox(
                                          heading: "Audit Soort",
                                          value: controller.companyDetailResponse!
                                              .companyDetailList!.first.type ??
                                              "",
                                        ),
                                        const SizedBox(width: 5),
                                        InfoBox(
                                          heading: "Locatie",
                                          value: controller
                                              .companyDetailResponse!
                                              .companyDetailList!
                                              .first
                                              .locationName ??
                                              "",
                                        )
                                      ],
                                    ),
                                  ),
                                  kVerticalSmallSizedBox,
                                  CustomLabel(
                                      label: Lang.labelCategory,
                                      widthDivision: 1,
                                      textStyle: TextStyle(
                                          color: kLabelTextColor,
                                          fontSize: size.width * 0.05)),
                                  kVerticalSmallSizedBox,
                                  SizedBox(
                                    height: Get.height * 0.4,
                                    child: ListView.builder(
                                        itemCount:
                                        snapshot.data!.companyDetailList!.length -
                                            1,
                                        itemBuilder: (context, index) {
                                          var data = snapshot
                                              .data!.companyDetailList![index + 1];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: categoryData(
                                                data.categoryName ?? '',
                                                1,
                                                15,
                                                context),
                                          );
                                        }),
                                  ),
                                  kVerticalSmallSizedBox,
                                  ShadowBgContainer(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomElevatedButton(
                                          text: "Start",
                                          ontap: () {
                                            controller.navigateToAuditFormulier();
                                          },
                                        ),
                                        CustomElevatedButton(
                                          text: "Resume",
                                          ontap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                          }else{
                            return const Center(
                              child: Text(
                                "Empty",
                              ),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Container(
                              width: Get.width,
                              height: Get.height,
                              color: Colors.white,
                              child: Image.asset('assets/Images/error.jpeg'));
                        } else {
                          return const Text('No data');
                        }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Row categoryData(
      String title, int outOfValue, int originalValue, BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width / 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          decoration: BoxDecoration(
              color: kLabelCategoryColor,
              borderRadius: BorderRadius.circular(15)),
        ),
        kHorizontalSmallSizedBox,
        Text(
          "$originalValue / $outOfValue",
          style: const TextStyle(fontSize: 24),
        )
      ],
    );
  }
}
