import 'package:flutter/material.dart';
import 'package:untitled9/features/Paying/Paying/presentation/pages/PaymentConfirmation.dart';
import 'package:untitled9/features/Paying/PaymentMethod/presentation/pages/PaymentMethod.dart';
import 'package:untitled9/features/Paying/ShippingAddress/presentation/pages/ShippingAddress.dart';
import 'package:untitled9/Color.dart';
class PayingScreen extends StatefulWidget {

  @override
  _PayingScreenState createState() => _PayingScreenState();
}

class _PayingScreenState extends State<PayingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("عنوان الشحن",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 108,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
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
                    child: Column(
                      children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("محافظة الدقهلية",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                          InkWell(onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShippingAddress()));

                          },child: Text("تغيير",style: TextStyle(color: Color(getColorHexFromStr("#009DDD")),fontWeight: FontWeight.bold,fontSize: 14),)),
                      ],),
                        Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
                      ],),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("وسيلة الدفع",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(    builder: (context) => PaymentMethod()));
                              },
                              child: Text("تغيير",style: TextStyle(color: Color(getColorHexFromStr("#009DDD")),fontWeight: FontWeight.bold,fontSize: 14),)),
                        ],),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/990px-Mastercard-logo.svg.png",width: 40,height: 40,)
                            ,SizedBox(width: 10,),
                            Text("7342**********",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                        ],),
                      ),


                      Text("وسيلة الشحن",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                      SizedBox(height: 10,),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          width: 100,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                            Image.network("https://gizchina.it/wp-content/uploads/2016/11/DHL-LOGO.jpg",
                              fit: BoxFit.fill,height: 40,width: 95),
                              Text("2-3 يوم",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),)
                            ],),
                        ),
                          Container(
                            width: 100,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfhZtIf-s4TjhXp2ofN7BZhk24o3wHU3R75Kjb5iUmq-Khau5aahowWDdCORgJAwRleA&usqp=CAU",
                                  fit: BoxFit.fill,height: 40,width: 95,),
                                Text("2-3 يوم",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),)
                              ],),
                          ),
                          Container(
                            width: 100,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.network("https://logos-world.net/wp-content/uploads/2020/04/FedEx-Logo.png",
                                  fit: BoxFit.cover,height: 40,),
                                Text("2-3 يوم",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),)
                              ],),
                          ),
                      ],),
SizedBox(height: 20,),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text(" سعر المنتج : ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                            Text("\$ 112  ",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                          ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("  سعر الشحن : ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                              Text("\$ 15  ",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                            ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("  الاسعر الاجمالى : ",style: TextStyle(color: Colors.grey,fontSize: 16),),
                              Text("\$ 128  ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ],),
                        ],),
                      )


                    ],),
                ),
              ),
            ],),
          ),

        SizedBox(height: 5,),
        Center(
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentConfirmationScreen()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width-30,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(getColorHexFromStr("#009DDD"))
              ),
              child: Center(child: Text("تأكيد الدفع",style: TextStyle(color: Colors.white,fontSize: 20),),),
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],),
    );
  }
}
