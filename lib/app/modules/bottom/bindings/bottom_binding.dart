import 'package:fantacy_user/app/modules/bottom/controllers/bottom_controller.dart';
import 'package:get/get.dart';

class BottomBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BottomController>(BottomController());
  }
}
