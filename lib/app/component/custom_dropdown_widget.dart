import 'package:fdis_mobile/app/modules/formulier/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.dropDownValues,
    this.onChanged,
    required this.hint,
    required this.value,
  }) : super(key: key);
  final String hint;
  final Rx<List<CategoryData>> dropDownValues;
  final String? value;
  final void Function(dynamic)? onChanged;

  get kLabelBgColor => const Color(0xffDDE3FC);

  get kLabelFourmTextStyle => null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.width / 7,
          // margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: kLabelBgColor,
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(8)),
        ),
        Positioned(top: 4, left: 10.0, right: 0.0, child: Text(hint)),
        Padding(
          padding: EdgeInsets.only(left: 12, top: size.width / 90),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
              borderRadius: BorderRadius.circular(8),
              dropdownColor: kLabelBgColor,
              onChanged: onChanged,
              hint: Text(
                hint,
                style: kLabelFourmTextStyle,
              ),
              disabledHint: Text(
                hint,
                style: kLabelFourmTextStyle,
              ),
              isExpanded: true,
              value: value,
              items: dropDownValues.value
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.categoryName.toString(),
                        style: kLabelFourmTextStyle,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
