
import 'package:flutter/material.dart';

import '../../../../colors.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key, required this.heading, required this.value})
      : super(key: key);
  final String heading;
  final String value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 30, vertical: size.width / 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), boxShadow: kBgColorShadow),
        child: Column(
          children: [
            Text(
              heading,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: size.width * 0.05),
            ),
            Text(value,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: const Color(0xff5E8881), fontSize: size.width * 0.03))
          ],
        ),
      ),
    );
  }
}
