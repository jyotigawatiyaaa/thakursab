import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../colors.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.tabList[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: (value) {
            controller.tabIndex.value = value;
            // if (value == 2) {
            //   print("url launcher");
            //   controller.launchURLApp();
            // }
          },
          items: const [
            BottomNavigationBarItem(
                label: "Audit", icon: Icon(Icons.file_copy)),
            BottomNavigationBarItem(
                label: "Setting", icon: Icon(Icons.settings)),
            BottomNavigationBarItem(
                label: "help", icon: Icon(Icons.info_outline_rounded))
          ],
        ),
      ),
    );
  }
}

class CustomLabel extends StatelessWidget {
  const CustomLabel(
      {Key? key,
      required this.label,
      required this.widthDivision,
      required this.textStyle})
      : super(key: key);
  final String label;
  final double widthDivision;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
          horizontal: 20, vertical: size.width / 50),
      decoration: BoxDecoration(
        color: kLabelBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
