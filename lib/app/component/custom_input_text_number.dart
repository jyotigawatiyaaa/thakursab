import 'package:flutter/material.dart';

import '../colors.dart';

class CustomInputTextForNumber extends StatelessWidget {
  const CustomInputTextForNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 8,
      decoration: BoxDecoration(
          color: kTextFieldBgColor, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        controller: TextEditingController(text: "100"),
      ),
    );
  }
}
