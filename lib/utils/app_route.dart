import 'package:falcon_aviation/view/screen/file_manager/file_manager.dart';
import 'package:falcon_aviation/view/screen/home/home_screen.dart';
import 'package:falcon_aviation/view/screen/login/login_screen.dart';
import 'package:falcon_aviation/view/screen/profile/edit_profile_screen.dart';
import 'package:falcon_aviation/view/screen/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';

import '../view/screen/splash/splash_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route page = CupertinoPageRoute(
    builder: (context) => SplashPage(),
  );
  switch (settings.name) {
    case "/splash":
      page = CupertinoPageRoute(
        builder: (context) => SplashPage(),
      );
      break;
    case "/login":
      page = CupertinoPageRoute(
        builder: (context) => LoginScreen(),
      );
      break;
    case "/home":
      page = CupertinoPageRoute(
        builder: (context) => HomeScreen(),
      );
      break;
    case "/profile":
      page = CupertinoPageRoute(
        builder: (context) => ProfileScreen(),
      );
      break;

    case "/edit_profile":
      page = CupertinoPageRoute(
        builder: (context) => EditProfileScreen(),
      );
      break;

    case "/file_manager":
      page = CupertinoPageRoute(
        builder: (context) => FileManager(),
      );
      break;







  // case "/onboard":
    //   page = CupertinoPageRoute(
    //     builder: (context) => Onbording(),
    //   );
    //   break;
  }
  return page;
}
