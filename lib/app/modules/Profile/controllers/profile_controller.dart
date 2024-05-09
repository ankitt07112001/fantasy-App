import 'package:fantacy_user/app/modules/modellist/controllers/modellist_controller.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/base_widgets.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  //TODO: Implement ProfileController
  var carousel = [
    "https://miro.medium.com/v2/resize:fit:495/0*xFuo_UNWchLZ8bqS.jpeg"
    // 'https://justtry.thecompletesoftech.in/uploads/app_setting/splash_logo/1701150649_65657fb90a1c7.jpg',
    // 'https://justtry.thecompletesoftech.in/uploads/app_setting/app_logo/1701150404_65657ec46fcb3.jpg',
  ];
  // List<String> strings = List<String>.from(carousel);
  var image =
      "https://www.pgclick.com/file_uploads/pg_photos/1000/jDrCn_1564331948.JPG";
  final count = 0.obs;
  var pageIndex = 0;
  get loaderclr => null;
  var title = "Post";
  String Firstpage = "First page";
   List EditList = [
    {
      "name": "Edit Profile",
      "icon": Icon(Icons.contact_emergency),
    },
    {
      "name": "Push Notification",
      "icon": Icon(Icons.notification_add),
    },
    {
      "name": "Change Password",
      "icon": Icon(Icons.lock),
    },
    {
      "name": "Wallet",
      "icon": Icon(Icons.wallet),
    },
    {
      "name": "Notification",
      "icon": Icon(Icons.notification_add_outlined),
    },
    {
      "name": "Loogout",
      "icon": Icon(Icons.logout),
    },
  ];
 
  bool switchValue = false;
  String selected = "Ankara";
}
