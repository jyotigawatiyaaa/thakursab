
import 'package:flutter/material.dart';
import '../constant.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.text, required this.ontap})
      : super(key: key);

  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: ontap,
      child: Text(
        text.toUpperCase(),
        style: kLargeHeadingTextStyle.copyWith(
            color: Colors.white, fontSize: size.width * 0.04),
      ),
    );
  }
}