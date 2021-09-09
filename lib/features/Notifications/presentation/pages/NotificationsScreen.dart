import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
class NotificationsScreen extends StatefulWidget {

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "الاشعارات",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
            separatorBuilder: (_, __) => Center(child: Text("------------------------------------",style: TextStyle(color: Colors.grey),)),
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height:50,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://image.flaticon.com/icons/png/512/3721/3721984.png"),fit: BoxFit.cover),
                        ),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("تم توصيل منتجك",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          Text("هناك حقيقة مثبتة منذ زمن طويل",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                        ],),

                      Container(
                        width: 55,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Color(getColorHexFromStr("#5663FF")).withOpacity(.1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("5:30 am",style: TextStyle(color: Colors.black,fontSize: 12),),
                          ],
                        ),
                      ),

                    ]
                ),
              );
            }),
      ),
    );
  }
}
