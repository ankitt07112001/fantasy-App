part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const MAINPAGE = _Paths.MAINPAGE;
  static const MODELLIST = _Paths.MODELLIST;
  static const MODELDETAIL = _Paths.MODELDETAIL;
  static const AUTH = _Paths.AUTH;
  static const INTRO = _Paths.INTRO;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const SIGNUPINTRO = _Paths.SIGNUPINTRO;
  static const FORGETPASS = _Paths.FORGETPASS;
  static const GUID = _Paths.GUID;

  static const PROFILE = _Paths.PROFILE;
  static const MODELPOST = _Paths.MODELPOST;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const EDIT_PROFILE_FORGOT = _Paths.EDIT_PROFILE_FORGOT;

  // static const OTPSIGNUP = _Paths.OTPSIGNUP;
  static const CALL = _Paths.CALL;
  static const SEARCH = _Paths.SEARCH;
  static const VEDIO_CALL = _Paths.VEDIO_CALL;
  // static const SEARCH = _Paths.SEARCH;
  static const CHAT = _Paths.CHAT;
  static const VEDIOCALL = _Paths.VEDIOCALL;
  static const NOTIFICATION = _Paths.NOTIFICATION;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const MAINPAGE = '/mainpage';
  static const MODELLIST = '/modellist';
  static const MODELDETAIL = '/modeldetail';
  static const AUTH = '/auth';
  static const INTRO = '/introview';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const SIGNUPINTRO = '/signupintro';
  static const FORGETPASS = '/forgetpass';
  static const GUID = '/guidlines';

  static const PROFILE = '/profile';
  static const MODELPOST = '/modelpost';
  static const EDIT_PROFILE = '/edit-profile';
  static const EDIT_PROFILE_FORGOT = '/edit-FORGOT';

  // static const OTPSIGNUP = '/otp_verify_signup';
  static const CALL = '/call';
  static const SEARCH = '/search';
  static const VEDIO_CALL = '/vedio-call';
  // static const Search = '/search';
  static const CHAT = '/chat';
  static const VEDIOCALL = '/vediocall';
  static const NOTIFICATION = '/notification';
}
