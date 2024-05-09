import 'package:fantacy_user/app/modules/auth/views/Socialbutton.dart';
import 'package:fantacy_user/app/modules/auth/views/auth_header.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';
import 'package:flutter/gestures.dart';
import '../controllers/auth_controller.dart';
import 'otp_verify_signup.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({Key? key}) : super(key: key);

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
                    child: Headerwidget(headername: Strings.signuptitle)),
                body: SingleChildScrollView(
                  child: Form(
                    key: controller.SignupformKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextField(
                          controller: controller.fullname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return (Strings.errormsg + Strings.fullname);
                            }
                            return null;
                          },
                          hinttext: Strings.fullname,
                        ).paddingOnly(bottom: 20, top: 50),
                        CommonTextField(
                          controller: controller.displayname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return (Strings.errormsg + Strings.displayname);
                            }
                            return null;
                          },
                          hinttext: Strings.displayname,
                        ).paddingOnly(bottom: 20),
                        CommonTextField(
                          controller: controller.signupemail,
                          validator: (value) {
                            // Trim the input value to remove leading and trailing whitespace
                            final trimmedValue = value?.trim();
                            if (trimmedValue == null || trimmedValue.isEmpty) {
                              return 'Please enter an email address.';
                            }
                            final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9]+@[a-zA-Z]+\.(com)\s*$",
                              caseSensitive: false,
                            ).hasMatch(trimmedValue);
                            if (!emailValid) {
                              return 'Please enter a valid Email (e.g. example@gmail.com)';
                            }
                            return null;
                          },
                          hinttext: Strings.emaillabel,
                        ).paddingOnly(bottom: 20),
                        CommonTextField(
                          controller: controller.signupphone,
                          keyboradtype: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a valid phone number';
                            } else if (!RegExp(r'^[6-9][0-9]{9}$|^5[0-9]{8}$').hasMatch(value)) {
                              return 'Invalid phone number';
                            }
                            return null; // Return null if validation passes
                          },
                          hinttext: Strings.phone,
                        ).paddingOnly(bottom: 10),

                        CommonTextField(
                          controller: controller.signupdob,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return (Strings.errormsg + Strings.date);
                            }
                            return null;
                          },
                          readtype: true,
                          hinttext: Strings.datelabel,
                          suffixshowicon: true,
                          suffixicon: Icons.calendar_today_outlined,
                          suffix_icon_color: controller.appColors.appColor,
                          ontapsufixicon: () {controller.selectDate(context);},
                          ontap: () {},
                        ).paddingSymmetric(vertical: 15),
                        MyTextView(
                          Strings.gender,
                          isMaxLineWrap: true,
                          textStyleNew: MyTextStyle(
                            textColor: controller.appColors.txtblack,
                            textWeight: FontWeight.w400,
                            textSize: 16.px,
                          ),
                          textAlignNew: TextAlign.center,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              child: Radio(
                                  value: 'male',
                                  activeColor: controller.appColors.appColor,
                                  groupValue: controller.selectedgender,
                                  onChanged: (e) {
                                    controller.selectedgender = e!;
                                    controller.update();
                                  }),
                            ),
                            InkWell(
                              onTap: () {
                                controller.selectedgender = 'male';
                                controller.update();
                              },
                              child: MyTextView(
                                Strings.male,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.txtblack,
                                  textWeight: FontWeight.w400,
                                  textSize: 16.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ).paddingOnly(left: 10),
                            ),
                            Radio(
                                value: 'female',
                                activeColor: controller.appColors.appColor,
                                groupValue: controller.selectedgender,
                                onChanged: (e) {
                                  controller.selectedgender = e!;
                                  controller.update();
                                }),
                            InkWell(
                              onTap: () {
                                controller.selectedgender = 'female';
                                controller.update();
                              },
                              child: MyTextView(
                                Strings.female,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.txtblack,
                                  textWeight: FontWeight.w400,
                                  textSize: 16.px,
                                ),
                                textAlignNew: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        CommonTextField(
                          controller: controller.signuppassword,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Password is required'
                              : !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$').hasMatch(value)
                              ? 'Password must have 8 characters with a unique combination'
                              : null,
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
                        ).paddingSymmetric(vertical: 10),
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
                                    textColor: controller.appColors.lightgrey,
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
                        Center(
                          child: CommonButton(
                            color: controller.appColors.appColor,
                            title: Strings.signup,
                            isBig: true,
                            radius: 100.0,
                            textColor: controller.appColors.white,
                            onTap: () async {
                              if (controller.SignupformKey.currentState != null &&
                                  controller.SignupformKey.currentState!.validate()) {
                              Get.bottomSheet(Container(
                                height: MediaQuery.of(context).size.height * 0.75,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.0),
                                        topLeft:  Radius.circular(30.0)
                                    )
                                ),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    Otp_signup(),
                                  ],
                                ),
                              )); // Navigate to Otp_verify_signup
                              }
                            },
                          ).paddingOnly(top: 20),
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
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
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
              ),
              AuthHeader(
                title: Strings.signuptitle,
                showback: true,
              ),
            ],
          );
        });
  }
}
