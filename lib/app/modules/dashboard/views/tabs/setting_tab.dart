import 'package:fdis_mobile/app/component/custom_widgets.dart';
import 'package:fdis_mobile/app/lang/lang.dart';
import 'package:fdis_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:fdis_mobile/app/modules/dashboard/views/components/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant.dart';

class SettingTab extends GetView<DashboardController> {
  const SettingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomWidgets.customAppbar(Lang.settingTitle,
          leading:const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                   controller.logout();
                },
                icon:const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                ))
          ]),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            kMediumVerticalSizeBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImage(),
              ],
            ),
            kMediumVerticalSizeBox,
            Text(
              "Demo",
              // controller.user.value.firstName.toString(),
              style: TextStyle(
                fontSize: size.width * 0.06,
              ),
            ),
            Column(
              children: [
                SettingTileContainer(
                  title: "Audits Executed : ",
                  value: "12",
                ),
                SettingTileContainer(
                  title: "Last Client : ",
                  value: "DAVV",
                ),
                SettingTileContainer(
                  title: "Last Location visited : ",
                  value: "Locatie A",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingTileContainer extends StatelessWidget {
  const SettingTileContainer({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.width / 80, horizontal: size.width / 20),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Text(
                title.toUpperCase(),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          )),
    );
  }
}
