import 'package:fdis_mobile/app/constant.dart';
import 'package:fdis_mobile/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width / 10, vertical: size.height / 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "FORGET PASSWORD",
                    style: kHeadingTextStyle.copyWith(
                      fontSize: Get.size.width * 0.07,
                    ),
                  ),
                  // CustomTextField(hint: "Current Password",controller: ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
