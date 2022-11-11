import 'package:fdis_mobile/app/component/custom_widgets.dart';
import 'package:fdis_mobile/app/exception/error_message.dart';
import 'package:fdis_mobile/app/lang/lang.dart';
import 'package:fdis_mobile/app/modules/audits/model/all_audit_response.dart';
import 'package:fdis_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/components/shimmer_effect.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/tabs/setting_tab.dart';
import 'package:fdis_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant.dart';

class AuditTab extends GetView<DashboardController> {
  const AuditTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomWidgets.customAppbar(Lang.dashboardTitle,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingTab(),
                      ));
                },
                child: Image.asset(
                  "assets/Images/profile.jpg",
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
          actions: [IconButton(onPressed: () {
            controller.allAuditListAPI();
          }, icon: kReloadIcon)]),
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: FutureBuilder<List<AllAuditList>?>(
              future: controller.allAuditListAPI(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.kAuditListView, arguments: [
                                data.nameClientId.toString(),
                                ]);
                              },
                                title: Text(data.auditCode.toString(),style: kAudtisListHeadingTextStyle),
                                subtitle:
                                    Text(data.locationClientId.toString()),
                            trailing: const Icon(Icons.arrow_forward_ios,color: Colors.black),
                            );
                          });
                    }else if (snapshot.hasError) {
                      return Container(
                          width: Get.width,
                          height: Get.height,
                          color: Colors.white,
                          child: Image.asset('assets/Images/error.jpeg'));
                    }  else {
                      return const Text('No data');
                    }
                    }
                }
              )),
    );
  }
}
