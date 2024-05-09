import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class SocialButton extends StatelessWidget {
  AuthController controller;
  SocialButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        socialButton(
          'assets/icons/facebook.svg',
          () {},
        ),
        socialButton(
          'assets/icons/google.svg',
          () {
            // controller.GoogleLogin(context);
          },
        ),
        Platform.isIOS
            ? socialButton(
                'assets/icons/apple.svg',
                () {
                  // controller.appleLogin(context);
                },
              )
            : Container(),
      ],
    );
  }

  Widget socialButton(String image, VoidCallback? onPress) {
    return MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: controller.appColors.border,
          width: 1.0,
        ),
      ),
      color: controller.appColors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14),
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
