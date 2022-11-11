import 'package:flutter_demo/features/auth/login/login_navigator.dart';
import 'package:flutter_demo/navigation/app_navigator.dart';
import 'package:flutter_demo/navigation/error_dialog_route.dart';

//mix AppInitNavigator with LoginRoute to give it the ability to navigate to LoginPage
class AppInitNavigator with LoginRoute, ErrorDialogRoute {
  AppInitNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
