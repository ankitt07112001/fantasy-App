import 'package:get/get.dart';

import '../controllers/modellist_controller.dart';

class ModellistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModellistController>(
      () => ModellistController(),
    );
  }
}
