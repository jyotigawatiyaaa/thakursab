import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'custom_elevated_button.dart';

class ErrorHelper {
  static void showLoading() {
    Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: Get.size.width / 1.8,
            height: Get.size.height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CircularProgressIndicator(),
                Text(
                  "Please Wait",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }

  static void showErrorDialog(
      {String? title = "Error", String? message = "Something Went Wrong"}) {
    Get.dialog(Dialog(
      child: SizedBox(
        height: Get.size.height / 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Text(
                title ?? "",
                style: Get.textTheme.headline5,
              ),
              kMediumVerticalSizeBox,
              Text(
                message ?? "",
                style: Get.textTheme.bodyText2,
                maxLines: 2,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomElevatedButton(text: "Ok", ontap: () => Get.back()),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  static void showCustomDialog({
    String? title = "Error",
    String? message = "Something Went Wrong",
    required dynamic Function() onYes,
  }) {
    Get.defaultDialog(
        title: "Logout",
        middleText: "Are you sure .. ?",
        backgroundColor: Colors.white,
        titleStyle:const TextStyle(color: Colors.black),
        middleTextStyle:const TextStyle(color: Colors.black),
        textConfirm: "Yes",
        textCancel: "No",
        cancelTextColor: Colors.black,
        contentPadding:const EdgeInsets.all(10),
        confirmTextColor: Colors.white,
        buttonColor: Colors.blue,
        barrierDismissible: false,
        radius: 10,
        onCancel: (){Get.back();},
      onConfirm: onYes
    );




    //   (Dialog(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           title ?? "",
    //           style: Get.textTheme.headline6,
    //         ),
    //         kMediumVerticalSizeBox,
    //         Text(
    //           message ?? "",
    //           style: Get.textTheme.bodyText1,
    //         ),
    //      //   const Spacer(),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             CustomElevatedButton(text: "No", ontap: () => Get.back()),
    //             SizedBox(
    //               width: Get.size.width / 20,
    //             ),
    //             CustomElevatedButton(text: "yes", ontap: onYes)
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
  }
}
