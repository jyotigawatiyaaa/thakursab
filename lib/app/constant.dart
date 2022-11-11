import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'colors.dart';

const kHeadingTextStyle = TextStyle(color: Colors.blue);
const kLabelFourmTextStyle = TextStyle(color: kLabelTextColor, fontSize: 20);
const kDropHintStyle = TextStyle(color: kLabelTextColor, fontSize: 16);
const kAudtisListHeadingTextStyle =
    TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
//SizedBoxes;
final kMediumVerticalSizeBox = SizedBox(
  height: Get.size.height / 50,
);
final kRoundedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.blue));
final kRoundedInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.red));

const double defaultPadding = 16.0;
String TOKEN = '';

//Icons----------
const kReloadIcon = Icon(
  Icons.replay_outlined,
  color: Colors.black,
);
final kHorizontalSmallSizedBox = SizedBox(
  width: Get.size.height / 50,
);

final kVerticalSmallSizedBox = SizedBox(
  height: Get.size.width / 50,
);

const kLargeHeadingTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
