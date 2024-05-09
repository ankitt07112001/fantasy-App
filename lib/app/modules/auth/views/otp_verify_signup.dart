import 'package:fantacy_user/app/modules/auth/controllers/auth_controller.dart';
import 'package:fantacy_user/app/modules/auth/views/welcome_screen.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import '../../../../commons/common_widgets/Otp_widget.dart';

class Otp_signup extends GetView<AuthController>{
  const Otp_signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
        init: AuthController(),
        assignId: true,
        builder: (AuthController controller){
          return SingleChildScrollView(
              child: Column(
                children: [
                  CustomizableOtpVerify(
                    title: Strings.signupotp,
                    customImage: Image.asset(ImagePath.enterotpimg,height: 100).paddingOnly(bottom: 20),
                    verificationText: Strings.phonever,
                    resendButtonText: Strings.forgetresend,
                    verificationSub: Strings.verifyotp,
                    textSize: 30.0,
                  ),
                  CommonButton(title: Strings.enterotp,
                      color: controller.appColors.appColor,
                      isSmall: true,
                      radius: 30,
                      onTap: (){
                        // Get.to(WelcomeScreen());
                      })
                ],
              )
          );
        }
    );
  }
}