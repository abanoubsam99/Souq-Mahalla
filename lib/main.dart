import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/SplashScreen.dart';

void main() => runApp(MyApp());

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainNavigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(getColorHexFromStr("#EBEBEB")),
          fontFamily: 'Droid Arabic Kufi'
      ),
      home: SplashScreen(),
    );
  }
}
// App(isAdmin: false,)