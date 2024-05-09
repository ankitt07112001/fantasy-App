import 'package:fantacy_user/app/modules/auth/controllers/auth_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import '../../../../commons/common_widgets/Otp_widget.dart';
import 'create_password_forget.dart';

class Otp_verify extends GetView<AuthController> {
  const Otp_verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
        init: AuthController(),
        assignId: true,
        builder: (AuthController controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomizableOtpVerify(
                  title: Strings.forgettitle,
                  verificationText: Strings.phonever,
                  resendButtonText: Strings.forgetresend,
                  verificationSub: Strings.verifyotp,
                ),
                CommonButton(
                    title: Strings.otpverify,
                    isSmall: true,
                    radius: 30,
                    color: controller.appColors.appColor,
                    onTap: () {
                      Get.back();
                      Get.bottomSheet(
                        Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              )),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              Create_pass(),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          );
        });
  }
}
