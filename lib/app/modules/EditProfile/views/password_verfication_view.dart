import 'package:fantacy_user/app/modules/EditProfile/controllers/edit_profile_controller.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/Otp_text_Field_widget.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';

class PasswordVerficationView extends GetView<EditProfileController> {
  const PasswordVerficationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: ScalingQuery(context).height,
        child: Headerwidget(
          headername: "verification",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.px,
            ),
            Center(
                child: CircleAvatar(
              backgroundColor: controller.appColors.lightpink,
              radius: 70,
              child: Icon(
                Icons.phone_android_outlined,
                size: 53.px,
                color: controller.appColors.white,
              ),
            )),
            SizedBox(
              height: 60.px,
            ),
            CustomizableOtpVerify(
              title: 'Phone Verification',
              verificationText:
                  'Code has been sent to be' + controller.verify_phonenumber,
              resendButtonText: 'Dont get Otp',
              verificationSub: "",
            ),
            SizedBox(
              height: 30.px,
            ),
            CommonButton(
              color: controller.appColors.lightpink,
              title: 'Done',
              onTap: () {
                Get.to(PasswordVerficationView());
              },
            ).paddingSymmetric(horizontal: 30.px)
          ],
        ),
      ),
    );
  }
}
