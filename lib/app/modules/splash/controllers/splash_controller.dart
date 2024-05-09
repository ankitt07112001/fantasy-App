import 'dart:async';

import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';

import '../../../../commons/all.dart';

class SplashController extends BaseController {
  startTime() async {
    Timer(const Duration(seconds: 3), navigationPage);
  }

  navigationPage() {
    Get.offAllNamed(Routes.INTRO);
  }

  @override
  void onInit() {
    startTime();
    selectedLang = Constants.languageCodeEn;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
