import 'dart:async';
import 'package:fantacy_user/commons/all.dart';
import 'package:intl/intl.dart';
import '../../../../commons/common_widgets/base_widgets.dart';
import '../../../routes/app_pages.dart';

class AuthController extends BaseController {
  startTime() async {
    Timer(const Duration(seconds: 3), navigationPage);
  }

  navigationPage() {
    Get.offAllNamed(Routes.GUID);
  }

  PageController page = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final List<String> textList = [
    Strings.slide1Text,
    Strings.slide2Text,
    Strings.slide3Text
  ];
  late RxBool viaSMSSelected = true.obs; // Initialize with true
  var signupcheck = false;
  var createpassword = false;
  var selectedgender = 'male';
  final List<AssetImage> imageList = const [
    AssetImage('assets/images/slide_1.png'),
    AssetImage('assets/images/slide_2.png'),
    AssetImage('assets/images/slide_3.png'),
  ];
  final formKey = GlobalKey<FormState>();
  final formKeys = GlobalKey<FormState>();
  final SignupformKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController displayname = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signupphone = TextEditingController();
  TextEditingController signupdob = TextEditingController();
  TextEditingController createpass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  var showpass = false.obs;
  final RxInt _currentImageIndex = 0.obs;

  RxInt get currentImageIndex => _currentImageIndex;

  late StreamController<int> _resendTimerController;
  late Stream<int> resendTimerStream;

  @override
  void onInit() {
    super.onInit();
    _resendTimerController = StreamController<int>();
    resendTimerStream = _resendTimerController.stream;
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _resendTimerController.close();
    super.onClose();
  }

  void onImageIndexChange(int index) {
    _currentImageIndex.value = index;
  }

  void selectViaSMS() {
    viaSMSSelected.value = true;
    update(); // Notify listeners about the state change
  }

  void selectViaEmail() {
    viaSMSSelected.value = false;
    update(); // Notify listeners about the state change
  }

  void continueButtonPressed() {
    if (viaSMSSelected.value) {
      // Handle via SMS selection
      // print('SMS option selected');
    } else {
      // Handle via email selection
      // print("Email");
    }
  }

  void resendOTP() {
    const int resendDuration = 60; // Resend duration in seconds
    int secondsRemaining = resendDuration;
    _resendTimerController.sink.add(secondsRemaining);
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        _resendTimerController.sink.add(secondsRemaining);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Adjust as needed
      lastDate: DateTime.now(), // Adjust as needed
    );
    if (pickedDate != null) {
      // Update the text field with the selected date
      signupdob.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
