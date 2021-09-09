import 'package:flutter/material.dart';
class AllOrdersDetailsScreen extends StatefulWidget {
  String numberorder,date,numberfollow,status;
  Color colorstate;
  AllOrdersDetailsScreen({@required this.colorstate,@required this.numberfollow,@required this.date,@required this.numberorder,@required this.status});
  @override
  _AllOrdersDetailsScreenState createState() => _AllOrdersDetailsScreenState();
}

class _AllOrdersDetailsScreenState extends State<AllOrdersDetailsScreen> {
  int _val=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "حالة الاوردر",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(  "رقم الاوردر " +widget.numberorder,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                Text(widget.date,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13),),
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( "رقم التتبع: " + widget.numberfollow,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13),),
                Text(widget.status,style: TextStyle(color: widget.colorstate,fontWeight: FontWeight.bold,fontSize: 13),),

              ],),
            Container(
              width: MediaQuery.of(context).size.width,
              height:350 ,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  25,vertical: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration:BoxDecoration(
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
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/5+10,
                              height: 100,
                              decoration:BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      image: NetworkImage("https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg?size=338&ext=jpg"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("تيشرت رجالى مستورد",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                                      Row(children: [
                                          Text("اللون : ",style: TextStyle(color: Colors.grey,fontSize: 8),),
                                          Text("اسود",style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Row(
                                        children: [
                                          Text("المقاس : ",style: TextStyle(color: Colors.grey,fontSize: 8),),
                                          Text("L",style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("\$ 51  ",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ],),
                                ),
                              ),
                            ),


                          ],),


                      ),
                    );
                  }),
            ),
            SizedBox(height: 5,),
            Text("معلومات الاوردر",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5,),
                Text(" عنوان الشحن : ",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                SizedBox(width: 25,),

                Container(
                width: MediaQuery.of(context).size.width/2,
                  height: 50,
                  child: Text("هناك حقيقة مثبتة منذ زمن طويل وهي ان المحتوى المقروء",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),)),
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5,),

                Text(" البطاقة الائتمانية : ",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),

                Text("7342**********",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),

                Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/990px-Mastercard-logo.svg.png",width: 40,height: 40,)
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5,),

                Text(" طريفة الشحن : ",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                SizedBox(width: 20,),

                Text("FedEx, 3days,  15 \$",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),),
              ],),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5,),

                Text(" كود الخصم : ",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                SizedBox(width: 30,),

                Text("10 % Personal promo code",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),),
              ],),

            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5,),

                Text("الحساب الاجمالى : ",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),

                Text("133 \$",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),),
              ],),
          ],),
        ),
      ),

    );
  }
}
