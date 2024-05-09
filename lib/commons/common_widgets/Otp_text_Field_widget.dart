import 'package:fantacy_user/app/modules/auth/controllers/auth_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../commons/common_widgets/mytext_widgets.dart';

class CustomizableOtpVerify extends StatelessWidget {
  final String title;
  final verificationText;
  final verificationSub;
  final String resendButtonText;
  final Widget? customImage;
  final Color? textColor;
  final String? textFamily;
  final double? textSize;

  const CustomizableOtpVerify({
    Key? key,
    required this.title,
    this.verificationText,
    required this.resendButtonText,
    this.customImage,
    this.verificationSub, // Initialize with null for optional image
    this.textColor,
    this.textFamily,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    var size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
      init: AuthController(),
      assignId: true,
      builder: (AuthController controller) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(
                  title,
                  style: MyTextStyle(
                    textSize: 24,
                    textWeight: FontWeight.w500,
                  ),
                ).paddingOnly(bottom: 40, top: 20),
                if (customImage != null) customImage!,
                Text(
                  verificationText,
                  style: MyTextStyle(
                    textSize: textSize ?? 16.px,
                    textWeight: FontWeight.w500,
                    textFamily: textFamily ?? fontFamilyBold,
                    // textColor: textColor ?? appColors.white,
                  ),
                ).paddingOnly(bottom: 25),
                Text(
                  verificationSub,
                ).paddingOnly(bottom: 20),
                OtpTextField(
                  fieldWidth: 59.px,
                  fieldHeight: 53.px,
                  numberOfFields: 4,
                  borderColor: controller.appColors.lightBlack,
                  showFieldAsBox: true,
                ).paddingOnly(bottom: 15),
                StreamBuilder<int>(
                  stream: controller.resendTimerStream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return TextButton(
                      onPressed: () {
                        controller.resendOTP(); // Start the resend timer
                      },
                      child: Text(
                        snapshot.data == 0
                            ? resendButtonText
                            : 'Resend in ${snapshot.data} seconds',
                      ),
                    ).paddingOnly(bottom: 15);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
