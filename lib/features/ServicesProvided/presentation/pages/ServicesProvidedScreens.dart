import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
class ServicesProvidedScreens extends StatefulWidget {

  @override
  _ServicesProvidedScreensState createState() => _ServicesProvidedScreensState();
}

class _ServicesProvidedScreensState extends State<ServicesProvidedScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView.separated(
          separatorBuilder: (_, __) => Center(child: Text("------------------------------------")),
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
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(image: NetworkImage("https://image.flaticon.com/icons/png/128/3063/3063822.png"),fit: BoxFit.cover),
                      ),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("توصيل لحد البيت",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                        Text("هناك حقيقة مثبتة منذ زمن طويل",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                      ],),

                    Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color(getColorHexFromStr("#009DDD")),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center
                        ,children: [
                          Text("اطلب",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),

                  ]
              ),
            );
          }),


    );
  }
}
