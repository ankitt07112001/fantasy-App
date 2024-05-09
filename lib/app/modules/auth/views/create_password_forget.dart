import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import '../../../../commons/all.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class Create_pass extends GetView<AuthController>{
  const Create_pass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
      init: AuthController(),
      assignId: true,
      builder: (AuthController controller){
        return SingleChildScrollView(
          child: Container(
            child: Form(
              key: controller.formKeys,
              child: Column(
                children: [
                  Text(Strings.createpass,
                    style: MyTextStyle(
                      textSize:24,
                      // textHeight: 29,
                      textWeight: FontWeight.w700),).paddingOnly(top: 10),
                  Image.asset(ImagePath.createpass,height: 150,).paddingAll(15),
                  CommonTextField(
                    controller: controller.createpass,
                        validator: (value) {
                          var regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$')
                              .hasMatch(value!);
                          if (value.isEmpty) {
                            return 'enter your password';
                          } else if (regex == false) {
                            return 'your password should contain 8 character of unique combination of characters, symbols, and numbers(e.g., @, A, a, #, 0-9)';
                          }
                          return null;
                        },
                    hinttext: Strings.createpasstex,
                    obsecuretext: controller.showpass.value ? false : true,
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
                  ).paddingOnly(top: 10, bottom: 10).paddingSymmetric(horizontal: 15),
                  CommonTextField(
                    onchange: (){},
                    controller: controller.confirmpass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Confirm Password";
                        } else if (controller
                            .createpass.text !=
                            controller.confirmpass.text) {
                          return "Password Do Not Match";
                        }
                        return null;
                      },
                    prefixicon: Icons.lock,
                    hinttext: Strings.confirmpass,
                    obsecuretext: controller.showpass.value ? false : true,
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
                  ).paddingOnly(top: 10, bottom: 10).paddingSymmetric(horizontal: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          activeColor: controller.appColors.shedow,
                          value: controller.createpassword,
                          onChanged: (e) {
                            controller.createpassword =
                            !controller.createpassword;
                            controller.update();
                          }),
                      Text(Strings.createcheck,
                        style:MyTextStyle(
                        textColor:controller.createpassword ? controller.appColors.shedow : null,
                        textWeight: FontWeight.w600,
                          textSize: 14
                        ),).paddingOnly(right: 17)
                    ],
                  ),
                  CommonButton(
                      title: Strings.passwordbutton,
                      isSmall: true,
                      radius: 30,
                      color: controller.createpassword ? controller.appColors.shedow : controller.appColors.appColor,
                      onTap: () async {
                        if (controller.formKeys.currentState!
                            .validate()) {
                          // Get.offAllNamed(Routes.HOME);
                        }
                      })
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}