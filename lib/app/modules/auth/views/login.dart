import 'package:fantacy_user/app/modules/auth/views/Socialbutton.dart';
import 'package:fantacy_user/app/modules/auth/views/auth_header.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
        init: AuthController(),
        assignId: true,
        builder: (_) {
          return Stack(
            children: [
              Scaffold(
                appBar: PreferredSize(
                    preferredSize: ScalingQuery(context).height,
                    child: Headerwidget(
                      headername: Strings.logintitle,
                    )),
                body: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            ImagePath.loginimage,
                            height: 250.0,
                          ).paddingOnly(top: 15),
                        ),
                        Column(
                          children: [
                            CommonTextField(
                              controller: controller.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return (Strings.errormsg +
                                      Strings.emailphonelabel);
                                }
                                // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                //   return Strings.emailerrormsg;
                                // }
                                return null;
                              },
                              hinttext: Strings.emailphonelabel,
                            ).paddingOnly(bottom: 10),
                            CommonTextField(
                              controller: controller.password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return (Strings.errormsg + Strings.password);
                                }
                                return null;
                              },
                              hinttext: Strings.password,
                              obsecuretext:
                                  controller.showpass.value ? false : true,
                              suffixshowicon: true,
                              suffixicon: controller.showpass.value
                                  ? Icons.visibility_sharp
                                  : Icons.visibility_off_sharp,
                              suffix_icon_color: controller.appColors.appColor,
                              ontapsufixicon: () {
                                controller.showpass.value =
                                    !controller.showpass.value;
                                controller.update();
                              },
                            ).paddingSymmetric(vertical: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    activeColor: controller.appColors.appColor,
                                    value: controller.signupcheck,
                                    onChanged: (e) {
                                      controller.signupcheck =
                                          !controller.signupcheck;
                                      controller.update();
                                    }),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: Strings.termsmsg,
                                      style: MyTextStyle(
                                        textColor:
                                            controller.appColors.lightgrey,
                                        textWeight: FontWeight.w400,
                                        textSize: 16.px,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          // recognizer: TapGestureRecognizer()
                                          //   ..onTap = () => launchUrl(Uri.parse(
                                          //       'https://fuffy.io/terms-of-services/')),
                                          text: Strings.termsmsg1,
                                          style: MyTextStyle(
                                            textColor:
                                                controller.appColors.lightblue,
                                            textWeight: FontWeight.w400,
                                            textSize: 16.px,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CommonButton(
                              color: controller.appColors.appColor,
                              title: Strings.login,
                              isBig: true,
                              radius: 100.0,
                              textColor: controller.appColors.white,
                              onTap: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  Get.offAllNamed(Routes.MAINPAGE);
                                }
                              },
                            ).paddingOnly(top: 10, bottom: 25),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.FORGETPASS),
                              child: MyTextView(
                                Strings.forgetpass,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.lightblue,
                                  textWeight: FontWeight.w600,
                                  textSize: 16.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ),
                            ),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: MyTextView(
                                    Strings.continuewith,
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
                            SocialButton(controller: controller),
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
                                          textColor:
                                              controller.appColors.lightblue,
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
                      ],
                    ),
                  ),
                ),
              ),
              AuthHeader(
                title: Strings.logintitle,
                showback: true,
              ),
            ],
          );
        });
  }
}
