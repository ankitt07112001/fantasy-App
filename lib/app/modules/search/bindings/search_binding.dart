import 'package:get/get.dart';

import '../../../../commons/all.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchsController>(
      () => SearchsController(),
    );
  }
}
