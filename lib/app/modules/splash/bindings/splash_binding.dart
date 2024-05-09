import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
      () => BaseController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
