import 'package:flutter/material.dart';
import 'package:untitled9/features/AllOrders/presentation/pages/AllOrdersDetailsScreen.dart';
class ExpiredOrdersScreen extends StatefulWidget {

  @override
  _ExpiredOrdersScreenState createState() => _ExpiredOrdersScreenState();
}

class _ExpiredOrdersScreenState extends State<ExpiredOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "الطلبات المنتهية",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160 ,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الاوردر 54214665",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                            Text("05 - 10 - 2021",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13),),
                          ],),
                        Row(
                          children: [
                            Text("رقم التتبع: ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13),),
                            Text("5436521789",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 13),),
                          ],),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("الكمية: ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13),),
                                Text("3",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 13),),
                              ],),
                            Row(
                              children: [
                                Text("الحساب الاجمالى: ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13),),
                                Text("\$ 112 ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                              ],),
                          ],),


                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 93,
                              height: 33,
                              child: OutlineButton(
                                color:  Colors.black,
                                child: new Text("التفاصيل",style:TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26.0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => AllOrdersDetailsScreen(
                                    numberfollow: "5436521789",
                                    date: "05 - 10 - 2021",
                                    numberorder: "54214665",
                                    status:"تم توصيله ",
                                    colorstate: Colors.green,


                                  )

                                  ));
                                },
                              ),
                            ),
                          Text("تم توصيله ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 13),)
                          ],
                        ),

                      ],),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
