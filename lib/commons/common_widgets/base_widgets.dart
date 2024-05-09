import '../all.dart';
import '../get_storage_data.dart';

class BaseController extends GetxController {
  AppColors appColors = AppColors();
  Utils utils = Utils();
  GetStorageData getStorageData = GetStorageData();
  var appName = 'Fantasy';
  var splashimage = 'https://financialintelligence.site/images/Logo.png';
  var splashmsg = 'Connect with your Fantasy';
  @override
  void onInit() {
    setdata();
    super.onInit();
  }

  setdata() {
    appColors.appColor = Color(0xFFFF9E9E);
  }
}

class BaseScreen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;
  const BaseScreen(
      {Key? key,
      required this.child,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils().hideKeyboard();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: SafeArea(
          top: false,
          bottom: false,
          child: child,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
