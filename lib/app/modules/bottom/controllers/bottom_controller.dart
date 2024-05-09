import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fantacy_user/app/modules/Profile/views/profile_view.dart';
import 'package:fantacy_user/app/modules/call/views/index_view.dart';
import 'package:fantacy_user/app/modules/home/controllers/home_controller.dart';
import 'package:fantacy_user/app/modules/home/views/home_view.dart';
import 'package:fantacy_user/app/modules/modellist/views/modellist_view.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';

import '../../../../commons/all.dart';
import '../../Chat/views/chat_view.dart';
import '../../modellist/controllers/modellist_controller.dart';

class BottomController extends BaseController {
  RxInt screenIndex = 0.obs;
  String isMinusSubscribe = "0";
  bool isMarkerDiscount = true;

  List<Widget> screen = [
    HomeView(),
    ModellistView(),
    ChatView(),
    Profile_view(),
  ];

  @override
  void onInit() {
    screenIndex.value = 0;
    Get.put<HomeController>(HomeController());
    Get.put<ModellistController>(ModellistController());
    Get.put<ProfileController>(ProfileController());
    // Get.put<ModellistController>(ModellistController());
    getUserData();
    update();
    super.onInit();
  }

  getUserData() {
    if (getStorageData.containKey(getStorageData.loginData)) {
      // LoginModel loginModel = LoginModel.fromJson(getStorageData.readObject(getStorageData.loginData));
      // if (loginModel.responseCode == 1) {
      //   isMinusSubscribe = loginModel.data!.isMinusSubscribe!;
      //   printAction("isMinusSubscribe===>>> $isMinusSubscribe");
      //   update();
      // } else {
      //   utils.showSnackBar(context: Get.context!, message: loginModel.responseMsg!);
      // }
    }
  }
}

/// todo -=-=-=-=-=-=-=-=-=- for half circle in bottom bar
class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
