import 'package:fdis_mobile/app/colors.dart';
import 'package:fdis_mobile/app/component/custom_widgets.dart';
import 'package:fdis_mobile/app/modules/audits/controllers/audit_model_controller.dart';
import 'package:fdis_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuditsListView extends GetView<AuditModelController> {
  const AuditsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomWidgets.customAppbar("Audit",
            actions: [],
            leading: BackButton(
              color: kLabelTextColor,
              onPressed: () {
                Get.back();
              },
            )),
        body: Obx(() => controller.isLoading.value ? const Center(
                child: CircularProgressIndicator(),
              ) : controller.companyList.isEmpty ? const Center(
                    child: Text("No Audits found"),
                  ) : ListView.builder(
                    itemCount: controller.companyList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.companyList[index].auditCode.toString()),
                        subtitle:
                            Text(controller.companyList[index].location!.name ?? ''),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                           // Navigator.pushNamed(context, Routes.kAuditSingleForm,arguments: controller.companyList[index]);
                            Get.toNamed(Routes.kAuditSingleForm, arguments: [
                              controller.companyList[index].id.toString(),
                              controller.companyList[index].nameClientId.toString()
                            ]);
                          },
                        ),
                      );
                    })
        )
    );
  }
}
