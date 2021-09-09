import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share/share.dart';
import 'package:untitled9/features/Chat/presentation/pages/Chat.dart';
import 'package:untitled9/features/CustomerReviews/presentation/pages/CustomerReviewsScreens.dart';
import 'package:untitled9/features/OfferedProducts/presentation/pages/OfferedProductsScreen.dart';
import 'package:untitled9/features/ServicesProvided/presentation/pages/ServicesProvidedScreens.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOfferDetailsScreen.dart';
import 'package:url_launcher/url_launcher.dart';


class FeaturedStoresDetailsScreen extends StatefulWidget {

  @override
  _FeaturedStoresDetailsScreenState createState() => _FeaturedStoresDetailsScreenState();
}

class _FeaturedStoresDetailsScreenState extends State<FeaturedStoresDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  double _userRating = 3.0;
  IconData _selectedIcon;
  bool _isVertical = false;

  Future<void> _launched;
  String _phone = '01227120519';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL({@required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 - 30,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2 - 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2 - 30,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        // enlargeCenterPage: true,
                        //aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: _imgList
                        .map((item) => Container(
                      child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          )),
                    ))
                        .toList(),
                  ),
                ),
                Positioned(
                  bottom:10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(.16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _launched = _makePhoneCall('tel:$_phone');
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white
                                    ),
                                    child: Center(child:Icon(Icons.call,color: Color(getColorHexFromStr("#5663FF")),)),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("01227120519",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

                                ],
                              ),
                            ),
                            VerticalDivider(color: Colors.white, width: 20),

                            InkWell(
                              onTap: (){
                                setState(() {
                                  _launchURL(url: 'https://goo.gl/maps/kQofnzW95PtnN7mP6');
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white
                                    ),
                                    child: Center(child:Icon(Icons.location_on,color: Color(getColorHexFromStr("#5663FF")),)),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("الموقع",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 5,
                    left: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // IconButton(
                        //     onPressed: () {
                        //       Navigator.pop(context);
                        //     },
                        //     icon: Icon(
                        //       Icons.arrow_back_ios,
                        //       color: Colors.white,
                        //     )),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  Share.share('https://play.google.com/store/apps/developer?id=Abanoub+Samy+Badia&hl=ar&gl=US', subject: 'Look what I made!');
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),

                          ],
                        ),
                      ],
                    ))
              ],
            )),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
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
              ],)


            ],),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. تعطي توزيعاَ طبيعياَ ",
                style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.normal),),),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("المنتجات المقدمة",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                  Text("------------------------",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                ],),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => OfferedProductsScreen()));

                },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
              ),


            ],),
        ),




        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SpecialOfferDetailsScreen()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/3+10,
                            height:90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/excited-white-girl-bright-stylish-glasses-posing-pink-dreamy-curly-woman-playing-with-her-ginger-hair-laughing_197531-11045.jpg"),fit: BoxFit.cover),
                            ),
                          ),
                          Text("بنطلون مستورد",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                          Row(children: [
                            Text("15\$",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),),
                            SizedBox(width: 5,),
                            Text("12\$",style: TextStyle(color: Color(getColorHexFromStr("#009DDD")),fontSize: 13,fontWeight: FontWeight.bold),),

                          ],)
                        ]
                    ),
                  ),
                );
              }),
        ),


        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الخدمات المقدمة",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                  Text("------------------------",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                ],),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ServicesProvidedScreens()));

                },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
              ),


            ],),
        ),


        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: (){
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => SectionsDetailsScreen()));

                  },
                  child: Padding(
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
                  ),
                );
              }),
        ),
        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اراء العملاء",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                  Text("------------------------",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                ],),
              SizedBox(width: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: (){

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CustomerReviewsScreens()));

                },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
              ),

            ],),
        ),


        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: (){
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => SectionsDetailsScreen()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/stylish-man-hat-sunglasses_136403-4135.jpg"),fit: BoxFit.cover),
                            ),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("محمود عبده",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                            Text("هناك حقيقة مثبتة منذ زمن طويل وهي ان",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                          ],),

                      Container(
                        width: 55,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Color(getColorHexFromStr("#5663FF")).withOpacity(.1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center
                          ,children: [
                            Text("4.5",style: TextStyle(color: Colors.black),),
                            Icon(Icons.star,color: Colors.amber,size: 17,),
                          ],
                        ),
                      ),
                        ]
                    ),
                  ),
                );
              }),
        ),




        SizedBox(height: 100,),




      ],),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          child: Image.asset("assets/image/chat.png",color: Colors.white,),
          backgroundColor: Color(getColorHexFromStr("#009DDD"))
        ),
      ),
    );
  }
}


final List<String> _imgList = [
  'https://image.freepik.com/free-photo/ecstatic-white-girl-beret-posing-with-amazement-elegant-caucasian-female-model-t-shirt-standing-red-wall_197531-11462.jpg',
  'https://image.freepik.com/free-photo/stunning-curly-female-model-jumping-purple-indoor-portrait-slim-girl-bright-yellow-dress_197531-10836.jpg',
  'https://image.freepik.com/free-photo/inspired-laughing-girl-trendy-lush-dress-chilling-blue-macaroon-chair-with-eyes-closed-pretty-young-lady-wearing-heeled-white-shoes-relaxing-room-decorated-with-cookie-ice-cream_197531-2718.jpg',
  "https://image.freepik.com/free-photo/adorable-girl-with-curly-blonde-hair-posing-garden-portrait-caucasian-glad-woman-holding-pink-flower_197531-10490.jpg",
];