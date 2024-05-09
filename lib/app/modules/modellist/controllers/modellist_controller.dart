import 'dart:developer';

import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import 'package:fantacy_user/commons/imageUrl.dart';

import '../../../../commons/all.dart';

class ModellistController extends BaseController {
  //TODO: Implement ModellistController
  var carousel = [
    modelDetailHeaderUrl,
    modelDetailHeaderUrl1,
  ];
  var pageIndex = 0;
  var title = "Favourite";
  @override
  void onInit() {
    log("TITLE==" + title.toString());
    if (Get.arguments != null) {
      log("TITLE==" + title.toString());
      title = Get.arguments;
      update();
    }
    super.onInit();
  }

  updateheader() {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
