import 'package:flutter/material.dart';
import 'package:untitled9/features/HomePage/Cart/presentation/pages/CartScreen.dart';
import 'package:untitled9/features/HomePage/Favorite/presentation/pages/FavoriteScreen.dart';
import 'package:untitled9/features/HomePage/HomeScreen/presentation/pages/HomeScreen.dart';
import 'package:untitled9/features/HomePage/Sections/presentation/pages/SectionsScreen.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOffersScreen.dart';


class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem,this.isadmin});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final bool isadmin;

  @override
  Widget build(BuildContext context) {
    Widget child ;
    if(tabItem == "الكتالوج")
      child = SectionsScreen(
      );
    else if(tabItem == "السلة")
      child = CartScreen(
      );
    else if(tabItem == "الرئيسية")
      child = HomeScreen();
    else if(tabItem == "المفضلة")
      child = FavoriteScreen();
    else if(tabItem == "عروض خاصة")
      child =  SpecialOffersScreen(
      );
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child
        );
      },
    );
  }
}