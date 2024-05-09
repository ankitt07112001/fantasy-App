import '../../../../commons/all.dart';
import '../../../../commons/common_widgets/button_widget.dart';
import '../../../../commons/common_widgets/forget_widget.dart';
import '../controllers/auth_controller.dart';
import 'otp_verify_forget.dart';

class Forget_password extends GetView<AuthController> {
  const Forget_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
      init: AuthController(),
      assignId: true,
      builder: (AuthController controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text(Strings.forgettitle)),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                          ImagePath.forget,
                      height: 170,
                      )).paddingOnly(bottom: 20),
                  Text(Strings.forgetintro,
                    textAlign: TextAlign.center,
                    style:TextStyle(fontSize: 18.0)).paddingOnly(bottom: 10,left: 10,right: 10),
                  Forgettextbutton(
                    onTap: controller.selectViaSMS,
                    icon: Icons.email_rounded,
                    iconColor: controller.appColors.appColor,
                    text1: Strings.forgetmobile,
                    text2: Strings.forgetmobileno,
                    isSelected: controller.viaSMSSelected.value),
                  Forgettextbutton(
                      onTap:controller.selectViaEmail,
                      icon: Icons.message_rounded,
                      iconColor: controller.appColors.appColor,
                      text1: Strings.forgetemailtit,
                      text2: Strings.forgetemailsub,
                      isSelected: !controller.viaSMSSelected.value,
                  ).paddingOnly(bottom: 30),
                  CommonButton(
                    isSmall: true,
                      radius: 30,
                      color: controller.appColors.appColor,
                      title: Strings.forgetbutton,
                      onTap: (){
                      Get.bottomSheet(
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            )
                          ),
                          child: Otp_verify(),
                        ),
                      );})
                ],
              ),
            ),
          ),
        );
      },
    );
  }
        }