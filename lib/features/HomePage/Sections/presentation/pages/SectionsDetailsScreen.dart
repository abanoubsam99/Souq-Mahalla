import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/FeaturedStores/presentation/pages/FeaturedStoresDetailsScreen.dart';
import 'package:untitled9/features/FeaturedStores/presentation/pages/FeaturedStoresScreen.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOfferDetailsScreen.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOffersScreen.dart';
class SectionsDetailsScreen extends StatefulWidget {
  String title;
  SectionsDetailsScreen({@required this.title});

  @override
  _SectionsDetailsScreenState createState() => _SectionsDetailsScreenState();
}

class _SectionsDetailsScreenState extends State<SectionsDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  double _userRating = 3.0;
  IconData _selectedIcon;
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("متاجر مميزه",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("----------------",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("تعدد الاقسام",style: TextStyle(color: Color(getColorHexFromStr("#8A9EAD")),fontSize: 15,fontWeight: FontWeight.normal),)
                ],),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FeaturedStoresScreen()));
                },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
              ),

            ],),
        ),

        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 225,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => FeaturedStoresDetailsScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width-70,
                                height:205,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width-70,
                                height:140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight:Radius.circular(7) ),
                                  image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/fashionable-pale-brunette-long-green-dress-black-jacket-sunglasses-standing-street-during-daytime-against-wall-light-city-building_197531-24468.jpg"),fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                  top:10 ,
                                  left: 10,
                                  child:
                                  Container(
                                    width: 55,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center
                                      ,children: [
                                        Text("4.5",style: TextStyle(color: Colors.black),),
                                        Icon(Icons.star,color: Colors.amber,size: 17,),
                                      ],
                                    ),
                                  )),

                              Positioned(
                                  top:10 ,
                                  right: 10,
                                  child:
                                  Container(
                                    width: 50,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center
                                      ,children: [
                                        Text("مميز",style: TextStyle(color:Color(getColorHexFromStr("#009DDD"))),),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                top: 150,
                                right: 10
                                ,child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/fashionable-pale-brunette-long-green-dress-black-jacket-sunglasses-standing-street-during-daytime-against-wall-light-city-building_197531-24468.jpg"),fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 4,),

                                  Column(crossAxisAlignment: CrossAxisAlignment.start
                                    ,children: [
                                      Text("متجر محمود عبده",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      Text("ملابس حريمى",style: TextStyle(color: Colors.grey)),

                                    ],
                                  ),
                                  SizedBox(width: 15,),
                                ],),
                              ),
                              Positioned(
                                top: 150,
                                left: 20
                                ,child: Row(
                                children: [
                                  Column(children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround
                                      ,children: [
                                        Container(
                                          width: 55,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Color(getColorHexFromStr("#848DFF")),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Center(child: Text("1.2 km",style: TextStyle(color: Colors.white,fontSize: 12),),),
                                        ),
                                        SizedBox(width: 5,),

                                        Container(
                                          width: 55,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(getColorHexFromStr("#FF8C48")),
                                                  Color(getColorHexFromStr("#FF5673")),
                                                ]),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Center(child: Text("المنصورة",style: TextStyle(color: Colors.white,fontSize: 12),),),
                                        ),
                                      ],),
                                    SizedBox(height: 5,),

                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: _userRating,
                                          itemBuilder: (context, index) => Icon(
                                            _selectedIcon ?? Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          unratedColor: Colors.amber.withAlpha(50),
                                          direction: _isVertical ? Axis.vertical : Axis.horizontal,
                                        ),
                                        SizedBox(width: 5,),
                                        Text("(10)",style: TextStyle(color: Color(getColorHexFromStr("#9B9B9B")),fontSize: 12),),

                                      ],
                                    ),
                                  ],),
                                ],),
                              ),

                            ]
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),


        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("عروض خاصة",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("----------------",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("تستمر لفترة محدوده",style: TextStyle(color: Color(getColorHexFromStr("#8A9EAD")),fontSize: 15,fontWeight: FontWeight.normal),)
                ],),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SpecialOffersScreen()));
                },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
              ),


            ],),
        ),
        Directionality(
          textDirection: TextDirection.rtl,

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SpecialOfferDetailsScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/3,
                              height:300,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                            ),
                            Container(
                              width: 140,
                              height:170,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg"),fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                                top:135 ,
                                left: 7,
                                child:
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),),
                                )),
                            Positioned(
                                top:10 ,
                                left: 10,
                                child:
                                Container(
                                  width: 43,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color(getColorHexFromStr("#009DDD")),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(child: Text("-20%",style: TextStyle(color: Colors.white),),),
                                )),


                            Positioned(
                              top:180 ,
                              right: 5,
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl
                                    ,child: Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: _userRating,
                                        itemBuilder: (context, index) => Icon(
                                          _selectedIcon ?? Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 15.0,
                                        unratedColor: Colors.amber.withAlpha(50),
                                        direction: _isVertical ? Axis.vertical : Axis.horizontal,
                                      ),
                                      SizedBox(width: 5,),
                                      Text("(10)",style: TextStyle(color: Color(getColorHexFromStr("#9B9B9B")),fontSize: 12),),

                                    ],
                                  ),
                                  ),

                                  Text("ملابس حريمى",style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.normal),),
                                  Text("بنطلون مستورد",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                  Row(children: [
                                    Text("15\$",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),),
                                    SizedBox(width: 5,),
                                    Text("12\$",style: TextStyle(color: Color(getColorHexFromStr("#009DDD")),fontSize: 13,fontWeight: FontWeight.bold),),

                                  ],)
                                ],),
                            )

                          ]
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],),

    );
  }
}
