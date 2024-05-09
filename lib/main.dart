import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fantacy_user/app/modules/auth/bindings/auth_binding.dart';
import 'package:fantacy_user/app/modules/splash/bindings/splash_binding.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'api_repository/loading.dart';
import 'commons/all.dart';
import 'commons/get_storage_data.dart';
import 'languages/app_localizations_delegate.dart';
import 'languages/locale_constant.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  printOkStatus(
      'Handling a background message -----1----->>>>>${message.data}');
  printOkStatus(
      'Handling a background message ------2---->>>>> ${message.messageId}');
}

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> main() async {
  // final context = SecurityContext.defaultContext;
  // context.allowLegacyUnsafeRenegotiation = true;
  //-=-=-=-=-=-=- this fir camera =-=-=-=-=-=-=-
  WidgetsFlutterBinding.ensureInitialized();

  //-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=
  await GetStorage.init();

  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      playSound: true,
      importance: Importance.high,
      showBadge: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);
  }

  var isDenied = await Permission.notification.isDenied;
  if (isDenied) {
    var status = await Permission.notification.request();
  }

  runApp(const MyApp())
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocal(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    printAction(
        "test_newLocale: ${newLocale.languageCode} - ${newLocale.countryCode}");
    state?.setLocal(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? local;
  final notifications = FlutterLocalNotificationsPlugin();

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  GetStorageData getStorage = GetStorageData();
  StreamSubscription? sub;
  var initialUriIsHandled = false.obs;

  void tokenReceived(String pushToken) async {
    printOkStatus("main push token ---------->>>>> $pushToken");
    getStorage.saveString(getStorage.fcmToken, pushToken);
  }

  void setLocal(Locale locale) {
    setState(() {
      local = locale;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocale().then((locale) {
      setState(() {
        local = locale;
      });
    });
  }

  @override
  void initState() {
    changeLanguage(context, Constants.languageCodeEn);
    // firebaseInit();
    super.initState();
  }

  
  
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  @override
  Widget build(BuildContext context) {
    Loading();
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }

    // FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    Utils.screenPortrait();
    return GetMaterialApp(
      initialBinding: SplashBinding(),
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      supportedLocales: const [
        Locale(Constants.languageCodeEn, ''),
        Locale(Constants.languageCodeAr, ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      locale: local,
      theme: ThemeData(
        primarySwatch: AppColors.primerColor,
        fontFamily: fontFamilyBold,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            // TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
          },
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors().appColor, // button text color
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      builder: EasyLoading.init(),
    );
  }
}
