import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
class SubscriptionPlan extends StatefulWidget {

  @override
  _SubscriptionPlanState createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "خطة الاشتراك",
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
                          image: DecorationImage(image: NetworkImage("https://image.flaticon.com/icons/png/512/567/567055.png"),fit: BoxFit.cover),
                        ),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الخطة الاولى",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          Text("هناك حقيقة مثبتة منذ زمن",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                        ],),

                      Column(
                        children: [
                          Text("\$ 51 ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),

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
                        ],
                      ),

                    ]
                ),
              );
            }),
      ),

    );
  }
}
