import 'package:cached_network_image/cached_network_image.dart';
import 'package:fantacy_user/app/modules/splash/controllers/splash_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: controller.appColors.appColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.splash,
            height: 135,
            width: 150,
          ),
          MyTextView(
            controller.splashmsg,
            isMaxLineWrap: true,
            textStyleNew: MyTextStyle(
              textColor: controller.appColors.white,
              textWeight: FontWeight.w700,
              textSize: 35.px,
            ),
            textAlignNew: TextAlign.center,
          ).paddingOnly(top: 10, right: 20, left: 20)
        ],
      ),
    );
  }
}
