import 'dart:io';
import 'package:fantacy_user/app/modules/auth/views/auth_header.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import '../controllers/auth_controller.dart';

class SignupIntroView extends GetView<AuthController> {
  const SignupIntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: MyTextView(
                Strings.exitmsg,
                isMaxLineWrap: true,
                textStyleNew: MyTextStyle(
                  textColor: controller.appColors.txtblack,
                  textWeight: FontWeight.w700,
                  textSize: 16.px,
                ),
                textAlignNew: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: MyTextView(
                    Strings.yes,
                    isMaxLineWrap: true,
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.txtblack,
                      textWeight: FontWeight.w700,
                      textSize: 16.px,
                    ),
                    textAlignNew: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: MyTextView(
                    Strings.no,
                    isMaxLineWrap: true,
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.txtblack,
                      textWeight: FontWeight.w700,
                      textSize: 16.px,
                    ),
                    textAlignNew: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        );
      },
      child: GetBuilder<AuthController>(
          init: AuthController(),
          assignId: false,
          builder: (_) {
            return Stack(
              children: [
                Scaffold(
                  appBar: PreferredSize(
                      preferredSize: ScalingQuery(context).height,
                      child: Headerwidget(headername: Strings.signupas)),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            ImagePath.signupas,
                            height: 250.0,
                          ).paddingOnly(top: 5),
                        ),
                        Container(
                          width: size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: controller.appColors.border),
                              borderRadius: BorderRadius.circular(17.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                width: size.width * 0.28,
                                child: SvgPicture.asset(
                                  'assets/icons/facebook.svg',
                                ),
                              ).paddingOnly(right: 10),
                              MyTextView(
                                Strings.continuewithfb,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.txtblack,
                                  textWeight: FontWeight.w600,
                                  textSize: 16.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: controller.appColors.border),
                              borderRadius: BorderRadius.circular(17.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                width: size.width * 0.28,
                                child: SvgPicture.asset(
                                  'assets/icons/google.svg',
                                ),
                              ).paddingOnly(right: 10),
                              MyTextView(
                                Strings.continuewithgoogle,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.txtblack,
                                  textWeight: FontWeight.w600,
                                  textSize: 16.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ),
                            ],
                          ),
                        ).paddingOnly(top: 20),
                        if (Platform.isIOS)
                          Container(
                            width: size.width,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0,
                                    color: controller.appColors.border),
                                borderRadius: BorderRadius.circular(17.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: size.width * 0.28,
                                  child: SvgPicture.asset(
                                    'assets/icons/apple.svg',
                                  ),
                                ).paddingOnly(right: 10),
                                MyTextView(
                                  Strings.continuewithapple,
                                  isMaxLineWrap: true,
                                  textStyleNew: MyTextStyle(
                                    textColor: controller.appColors.txtblack,
                                    textWeight: FontWeight.w600,
                                    textSize: 16.px,
                                  ),
                                  textAlignNew: TextAlign.center,
                                ),
                              ],
                            ),
                          ).paddingOnly(top: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: controller.appColors.border,
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: MyTextView(
                                Strings.or,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.lightgrey,
                                  textWeight: FontWeight.w600,
                                  textSize: 16.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ).paddingOnly(bottom: 2),
                            ),
                            Expanded(
                              child: Divider(
                                color: controller.appColors.border,
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: 20),
                        Container(
                          width: size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: controller.appColors.border),
                              borderRadius: BorderRadius.circular(17.0)),
                          child: MyTextView(
                            Strings.signinwithmobile,
                            isMaxLineWrap: true,
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.txtblack,
                              textWeight: FontWeight.w600,
                              textSize: 16.px,
                            ),
                            textAlignNew: TextAlign.center,
                          ),
                        ),
                        CommonButton(
                          color: controller.appColors.appColor,
                          title: Strings.login,
                          isBig: true,
                          radius: 100.0,
                          textColor: controller.appColors.white,
                          onTap: () async {
                            Get.toNamed(Routes.LOGIN);
                          },
                        ).paddingOnly(top: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: Strings.dontaccount,
                                style: MyTextStyle(
                                  textColor: controller.appColors.lightgrey,
                                  textWeight: FontWeight.w400,
                                  textSize: 14.px,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => Get.toNamed(Routes.SIGNUP),
                                    text: Strings.signup,
                                    style: MyTextStyle(
                                      textColor: controller.appColors.lightblue,
                                      textWeight: FontWeight.w400,
                                      textSize: 14.px,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: 15),
                      ],
                    ).paddingSymmetric(horizontal: 15),
                  ),
                ),
                AuthHeader(
                  title: Strings.signupas,
                  showback: false,
                ),
              ],
            );
          }),
    );
  }
}
