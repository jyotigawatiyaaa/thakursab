import 'package:flutter/material.dart';

import '../colors.dart';

class CustomLabelBgWidget extends StatelessWidget {
  const CustomLabelBgWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 18,
      padding: EdgeInsets.symmetric(horizontal: size.width / 90),
      decoration: BoxDecoration(
        color: kLabelBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: child),
    );
  }
}
