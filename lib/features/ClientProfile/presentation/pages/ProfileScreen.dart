import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:untitled9/features/AboutApp/presentation/pages/AboutAppScreen.dart';
import 'package:untitled9/features/AllOrders/presentation/pages/AllOrdersScreen.dart';
import 'package:untitled9/features/AppEvaluation/presentation/pages/AppEvaluationScreen.dart';
import 'package:untitled9/features/BankAccount/presentation/pages/BankAccountScreen.dart';
import 'package:untitled9/features/Chat/presentation/pages/Chat.dart';
import 'package:untitled9/features/ClientProfile/presentation/widgets/ProfileItem.dart';
import 'package:untitled9/features/ClientProfile/presentation/widgets/SuggestionDialog.dart';
import 'package:untitled9/features/ExpiredOrders/presentation/pages/ExpiredOrdersScreen.dart';
import 'package:untitled9/features/Notifications/presentation/pages/NotificationsScreen.dart';
import 'package:untitled9/features/TechnicalSupport/presentation/pages/TechnicalSupport.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/EditeProfile/presentation/pages/EditeProfileScreen.dart';
import 'package:untitled9/features/SplashScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      child: Container(
                        width: 50,
                        child: Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                "assets/image/messages.png",
                                color: Colors.black,
                              ),
                            ),
                            Positioned(
                              bottom: 9,
                              left: 9,
                              child: Container(
                                width: 17,
                                height: 16,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        Color(getColorHexFromStr("#009DDD"))),
                                child: Center(
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationsScreen()));
                      },
                      child: Container(
                        width: 50,
                        child: Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.notifications_none,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              bottom: 9,
                              left: 9,
                              child: Container(
                                width: 17,
                                height: 16,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        Color(getColorHexFromStr("#009DDD"))),
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      textDirection: TextDirection.ltr
                      ,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19720.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "محمود عبده",
                        style: TextStyle(
                            color: Color(getColorHexFromStr("#515C6F")),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mahmoud-abdo@email.com",
                        style: TextStyle(
                            color: Color(getColorHexFromStr("#515C6F")),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 120,
                        height: 30,
                        child: OutlineButton(
                          child: new Text(
                            "تعديل البروفايل",
                            style: TextStyle(
                                color: Color(getColorHexFromStr("#727C8E")),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditeProfileScreen()));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileItem(
                    title: "جميع الطلبات",
                    iconData: Icons.list,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllOrdersScreen()));
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Divider(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  // ProfileItem(
                  //   title: "خطة الاشتراك",
                  //   iconData: Icons.subscriptions,
                  //   function: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => SubscriptionPlan()));
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ProfileItem(
                    title: "حساب البنك",
                    iconData: Icons.credit_card,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BankAccountScreen()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ProfileItem(
                    title: "الطلبات المنتهية",
                    iconData: Icons.card_travel,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExpiredOrdersScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileItem(
                    title: "دعوة الاصدقاء",
                    iconData: Icons.contact_mail,
                    function: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.bis.bis_building&hl=ar&gl=US',
                          subject: 'Look what I made!');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ProfileItem(
                    title: "الدعم الفنى",
                    iconData: Icons.call,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TechnicalSupport()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ProfileItem(
                    title: "تقييم التطبيق",
                    iconData: Icons.star_border,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppEvaluationScreen()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ProfileItem(
                    title: "عمل اقتراح او شكوى",
                    iconData: Icons.assignment_turned_in_outlined,
                    function: () {
                      // bottomSheetSuggestion(context: context);
                      showSuggestionDialog(context: context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileItem(
                    title: "عن التطبيق",
                    iconData: Icons.info_outline,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutAppScreen()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ProfileItem(
                    title: "تسجيل الخروج",
                    iconData: Icons.logout,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SplashScreen()));
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
