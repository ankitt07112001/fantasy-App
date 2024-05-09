import 'package:fantacy_user/app/modules/call/views/index_view.dart';
import 'package:get/get.dart';

import '../modules/EditProfile/bindings/edit_profile_binding.dart';
import '../modules/EditProfile/views/Edit_Forgot_View.dart';
import '../modules/EditProfile/views/edit_profile_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/Model_Post_Images.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/forget_password.dart';
import '../modules/auth/views/guidelines_view.dart';
import '../modules/auth/views/intro.dart';
import '../modules/auth/views/login.dart';
import '../modules/auth/views/signup.dart';
import '../modules/auth/views/signupintro.dart';
import '../modules/bottom/bindings/bottom_binding.dart';
import '../modules/bottom/views/bottom_screen.dart';
import '../modules/call/bindings/call_binding.dart';
import '../modules/call/views/call_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/modellist/bindings/modellist_binding.dart';
import '../modules/modellist/views/modeldetail_view.dart';
import '../modules/modellist/views/modellist_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../views/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAINPAGE,
      page: () => const BottomScreen(),
      binding: BottomBinding(),
    ),
    GetPage(
      name: _Paths.MODELLIST,
      page: () => const ModellistView(),
      binding: ModellistBinding(),
    ),
    GetPage(
      name: _Paths.MODELDETAIL,
      page: () => const ModeldetailView(),
      binding: ModellistBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPINTRO,
      page: () => const SignupIntroView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASS,
      page: () => const Forget_password(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const Profile_view(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MODELPOST,
      page: () => const Model_Post_Images(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_FORGOT,
      page: () => const Edit_Forgot_View(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CALL,
      page: () => const VideoCall(),
      binding: CallBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.GUID,
      page: () => const GuidelinesView(),
      binding: AuthBinding(),
    )
  ];
}
