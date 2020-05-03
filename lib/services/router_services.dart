import 'package:duet/screens/auth_view.dart';
import 'package:duet/screens/home_page.dart';
import 'package:duet/screens/login_page.dart';
import 'package:duet/screens/undifine_page.dart';
import 'package:duet/utilities/router_constants.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case AuthViewPageRoute:
      return MaterialPageRoute(builder: (context) => AuthView());
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case LoginPageRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    default:
      return MaterialPageRoute(builder: (context) => UndifinePage());
  }
}