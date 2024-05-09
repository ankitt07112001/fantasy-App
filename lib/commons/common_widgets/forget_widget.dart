import 'package:flutter/material.dart';

import '../all.dart';
import 'FullImage_widget.dart';
import 'mytext_widgets.dart';

class Forgettextbutton extends StatelessWidget {
  final onTap;
  final IconData icon;
  final Color iconColor;
  final String text1;
  final String text2;
  final bool isSelected;
  const Forgettextbutton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text1,
    required this.text2,
    this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey.shade200,
          border: Border.all(
            color: isSelected ? controller.appColors.appColor : Colors.transparent,
            width: 2
          )
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
                child: Center(child: Icon(icon, size: 30, color: iconColor))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextView(text1,
                  textStyleNew: MyTextStyle(
                    textColor: controller.appColors.grey,
                    textWeight: FontWeight.w500,
                    textSize: 16,
                  ),
                ),
                MyTextView(text2,
                  textStyleNew: MyTextStyle(
                    textColor: controller.appColors.grey,
                    textWeight: FontWeight.w500,
                    textSize: 16,
                  ),
                )
              ],
            ).paddingOnly(left: 15),
          ],
        ),
      ).paddingSymmetric(horizontal: 20, vertical: 10),
    );
  }
}
