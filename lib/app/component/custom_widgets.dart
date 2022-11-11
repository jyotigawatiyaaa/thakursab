import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomWidgets {
  static AppBar customAppbar(String title,
      {required List<Widget> actions, required Widget leading}) {
    return AppBar(
      elevation: 0.2,
      backgroundColor: Colors.white,
      leading: leading,
      title: Text(title,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.normal)),
      centerTitle: true,
      actions: actions,
    );
  }
}
