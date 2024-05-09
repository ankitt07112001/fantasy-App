import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import '../../../../commons/all.dart';

class SearchsController extends BaseController {
  //TODO: Implement SearchController

  RangeValues currentRangeValues = const RangeValues(40, 80);

  final count = 0.obs;

  var Selectedgender = 'male';

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
