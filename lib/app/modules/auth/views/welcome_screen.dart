import 'package:cached_network_image/cached_network_image.dart';
import 'package:fantacy_user/app/modules/auth/controllers/auth_controller.dart';
import 'package:fantacy_user/app/modules/splash/controllers/splash_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';

class WelcomeScreen extends GetView<AuthController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImagePath.welcome,
              height: 300,
              width: 300,
            ),
          ).paddingAll(10),
          MyTextView(
            Strings.welcome,
            isMaxLineWrap: true,
            textStyleNew: MyTextStyle(
              textColor: controller.appColors.linearGradient2,
              textWeight: FontWeight.w700,
              textSize: 50.px,
            ),
            textAlignNew: TextAlign.center,
          ).paddingOnly(top: 10, right: 20, left: 20)
        ],
      ),
    );
  }
}
