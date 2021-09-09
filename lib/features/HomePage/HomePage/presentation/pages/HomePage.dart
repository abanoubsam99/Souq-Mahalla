import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled9/features/ClientProfile/presentation/pages/ProfileScreen.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/SellerProfile/presentation/pages/ProviderProfileScreen.dart';
import 'package:untitled9/features/HomePage/HomePage/presentation/widgets/tab_navigator.dart';

class HomePage extends StatefulWidget {
  bool isAdmin;
  HomePage({@required this.isAdmin});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentPage = "الرئيسية";
  List<String> pageKeys = [
    "الكتالوج",
    "السلة",
    "الرئيسية",
    "المفضلة",
    "عروض خاصة"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "الكتالوج": GlobalKey<NavigatorState>(),
    "السلة": GlobalKey<NavigatorState>(),
    "الرئيسية": GlobalKey<NavigatorState>(),
    "المفضلة": GlobalKey<NavigatorState>(),
    "عروض خاصة": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 2;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Text('تأكيد الخروج ؟'),
          ],
        ),
        content: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Text('هل تريد الخروج من التطبيق'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('لا'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: new Text('نعم'),
          ),
        ],
      ),
    )) ?? false;
  }
  Future<bool> _checkisFirstRoute()async {
    final isFirstRouteInCurrentTab =
    !await _navigatorKeys[_currentPage].currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      _onWillPop();
      return false;
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: _checkisFirstRoute ,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(getColorHexFromStr("#F9F9F9")),
            elevation: 0,
            title: Text(
              _currentPage,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          drawer: widget.isAdmin?SellerProfileScreen():ProfileScreen(),
          body: Stack(
              children:<Widget>[
                _buildOffstageNavigator("الكتالوج"),
                _buildOffstageNavigator("السلة"),
                _buildOffstageNavigator("الرئيسية"),
                _buildOffstageNavigator("المفضلة"),
                _buildOffstageNavigator("عروض خاصة"),
              ]
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                selectedItemColor: Color(getColorHexFromStr("#009DDD")),
                onTap: (int index) { _selectTab(pageKeys[index], index); },
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.apps,
                        size: 30,
                      ),
                      title: Text(
                        'الكتالوج',
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      title: Text("السلة")),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                      ),
                      title: Text(
                        'الرئيسية',
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                      title: Text("المفضلة")),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.local_offer_outlined,
                        size: 30,
                      ),
                      title: Text("عروض خاصة"))
                ],
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ),
      ),
    );

  }



  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
