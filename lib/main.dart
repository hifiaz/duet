import 'package:duet/locator.dart';
import 'package:duet/screens/login_page.dart';
import 'package:duet/services/navigation_services.dart';
import 'package:duet/services/router_services.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: locator<NavigationServices>().navigationKey,
      onGenerateRoute: generateRoute,
      home: LoginPage()
    );
  }
}
