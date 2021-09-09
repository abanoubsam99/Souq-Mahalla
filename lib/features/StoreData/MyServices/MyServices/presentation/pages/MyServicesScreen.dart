import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/MyServices/EditeService/presentation/pages/EditeServiceScreen.dart';
import 'package:untitled9/features/StoreData/MyServices/AddService/presentation/pages/AddServiceScreen.dart';
class MyServicesScreen extends StatefulWidget {

  @override
  _MyServicesScreenState createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "خدماتى",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (_, __) => Center(child: Text("------------------------------------",style: TextStyle(color: Colors.grey),)),
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height:50,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("https://image.flaticon.com/icons/png/512/3043/3043312.png"),fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("توصيل لحد البيت",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                  Text("هناك حقيقة مثبتة منذ زمن",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                                ],),
                            ),

                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color:  Color(getColorHexFromStr("#009DDD")),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(child: IconButton(onPressed: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => EditeServiceScreen()));
                              }, icon: Icon(Icons.edit,color: Colors.white,size: 20,)),),
                            ),

                          ]
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10,),

            InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddServiceScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(getColorHexFromStr("#009DDD"))
                ),
                child: Center(child: Text("اضافة خدمة",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
