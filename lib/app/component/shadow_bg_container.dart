import 'package:flutter/material.dart';

import '../colors.dart';

class ShadowBgContainer extends StatelessWidget {
  const ShadowBgContainer({
    Key? key,
  required this.child,
  }) : super(key: key);

  final Widget child;


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: size.width / 20),
      decoration: BoxDecoration(
          boxShadow: kBgColorShadow,
          borderRadius: BorderRadius.circular(10)),
      child: child
    );
  }
}