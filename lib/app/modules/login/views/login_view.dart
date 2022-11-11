import 'package:fdis_mobile/app/component/custom_snack_bar.dart';
import 'package:fdis_mobile/app/modules/login/views/reset_password.dart';
import 'package:fdis_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

class Body extends GetView<LoginController> {
  Body({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 10, vertical: size.height / 10),
        child: Form(
          key: _formKey,
          child: IgnorePointer(
            ignoring: controller.isLoading.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Schoonmaak Audit",
                  style: kHeadingTextStyle.copyWith(
                    fontSize: Get.size.width * 0.07,
                  ),
                ),
                kMediumVerticalSizeBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    child: Image.asset('assets/Images/foto3-kopie.jpeg'),
                    width: size.width / 1.5,
                    height: size.width / 2,
                  ),
                ),
                kMediumVerticalSizeBox,
                kMediumVerticalSizeBox,
                CustomTextField(
                  controller: controller.userNameController,
                  hint: "User Name",
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Please Enter your User Name";
                    } else if (value.isEmpty) {
                      return "Please Enter your User Name";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: controller.passWordController,
                  textInputAction: TextInputAction.done,
                  hint: "Password",
                  validator: (value) {
                    if (value == null) {
                      return "Please Enter your Password";
                    } else if (value.isEmpty) {
                      return "Please Enter your Password";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()),
                        );
                      },
                      child: const Text('Forget Password?')),
                ),
                const SizedBox(height: 30),
                CustomTextButton(
                    isLoading: controller.isLoading.value,
                    text: "Login",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.login(context).then((value) {
                          if (value!.serverCode == 200) {
                            CustomSnackBar.showSnackBar(
                                value: value.loginData!.message ?? '', context: context);
                            Get.offAllNamed(Routes.kDashboard);
                          } else {
                            CustomSnackBar.showSnackBar(
                                value: value.message ?? '', context: context);
                          }
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.isLoading})
      : super(key: key);
  final String text;
  final bool isLoading;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 100,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ))),
          child: isLoading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : Text(text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
          onPressed: isLoading ? null : onTap),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hint,
      this.validator,
      required this.controller,
      this.textInputAction})
      : super(
          key: key,
        );
  final String hint;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder: kRoundedInputBorder,
          disabledBorder: kRoundedInputBorder,
          errorBorder: kRoundedInputErrorBorder,
          enabledBorder: kRoundedInputBorder),
    );
  }
}
