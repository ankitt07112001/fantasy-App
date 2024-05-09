import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';

class HomeController extends BaseController{
  TextEditingController search = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
