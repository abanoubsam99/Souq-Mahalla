import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled9/features/HomePage/Cart/presentation/pages/CartScreen.dart';
import 'package:untitled9/Color.dart';
class PaymentConfirmationScreen extends StatefulWidget {
  @override
  _PaymentConfirmationScreenState createState() => _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.pop(context);
    });

    // Start full screen
  //  SystemChrome.setEnabledSystemUIOverlays([]);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Image.network("https://image.freepik.com/free-vector/seasonal-sale-discounts-presents-purchase-visiting-boutiques-luxury-shopping-price-reduction-promotional-coupons-special-holiday-offers-vector-isolated-concept-metaphor-illustration_335657-2766.jpg"),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" تم الشراء بنجاح ! ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10,),
              Text("سيتم توصيل طلبك في اقرب وقت من الوقت الحالي شكرا لاختيارك تطبيقنا",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: InkWell(
              //     onTap: (){
              //       Navigator.pop(context);
              //       Navigator.pop(context);
              //     },
              //     child: Container(
              //       width: MediaQuery.of(context).size.width-30,
              //       height: 50,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(50),
              //           color: Color(getColorHexFromStr("#009DDD"))
              //       ),
              //       child: Center(child: Text("الاستمرار في التسوق",style: TextStyle(color: Colors.white,fontSize: 20),),),
              //     ),
              //   ),
              // ),
          ],),
        ),
      ),
    );
  }

}
