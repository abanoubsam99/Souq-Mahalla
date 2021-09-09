import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share/share.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/AppEvaluation/presentation/widgets/ProgressBars.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOfferDetailsScreen.dart';
class LatestProductsDetailsScreen extends StatefulWidget {
  @override
  _LatestProductsDetailsScreenState createState() => _LatestProductsDetailsScreenState();
}

class _LatestProductsDetailsScreenState extends State<LatestProductsDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  double _userRating = 3.0;
  IconData _selectedIcon;
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        body: ListView(
          children: [
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
                        items: imgList
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                  (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : _current == entry.key ? Colors.blue : Colors.white )
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 5,
                        left: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$ 19.99",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("تيشرت حريمي مستورد",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text("ملابس رجالى",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.normal),),
                      ),
                    ],),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Directionality(
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
                    itemSize: 20.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  ),
                  SizedBox(width: 5,),
                  Text("(10)",style: TextStyle(color: Color(getColorHexFromStr("#9B9B9B")),fontSize: 12),),

                ],
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام ",
                    style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.normal),),),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  children:<Widget> [
                    // the tab bar with two items
                    SizedBox(
                      height: 50,
                      child: AppBar(
                        bottom: TabBar(
                          indicatorColor: Color(getColorHexFromStr("#009DDD")),
                          unselectedLabelColor:Colors.grey ,
                          labelColor: Color(getColorHexFromStr("#009DDD")),
                          labelStyle: TextStyle(fontSize: 12),
                          labelPadding: EdgeInsets.symmetric(horizontal: 10),
                          tabs: [
                            Tab(
                              text: "الوصف",
                            ),
                            Tab(
                              text: "التقييم",
                            ),
                            Tab(
                              text: "التعليق",
                            ),

                            Tab(
                              text: "منتجات مشابهة",
                            ),
                          ],
                        ),
                      ),
                    ),

                    // create widgets for each tab bar here
                    Expanded(
                      child: TabBarView(
                        children: [
                          // first tab bar view widget
                          Container(
                            color: Colors.white,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2-20,
                                        child: Text(" المواصفات الأساسية :- \n\n - قطن %100 \n\n - 3 جيب \n\n- يغلق برباط من الوسط \n\n- ارجل ضيقة",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2-20,
                                        child: Text("لوريم إيبسوم(Lorem Ipsum)  نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة(بمعنى أن الغاية هي الشكل وليس المحتوى) بمثابة تى صار مستخدماً وبشكله الأصلي ."
                                          ,style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.normal),)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // second tab bar viiew widget
                          Container(
                            color: Colors.white,
                            child: Center(
                              child:   Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('4.4',style: TextStyle(fontSize: 40,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.bold),),
                                      Text("23 Ratings",style: TextStyle(fontSize: 13,color: Colors.black.withOpacity(0.5),decoration: TextDecoration.none),textDirection: TextDirection.ltr,)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 110,
                                    width: MediaQuery.of(context).size.width/2+50,
                                    child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (ctx,index){
                                        return ProgressBars(
                                            num: progressBarData[index]['num'],
                                            value: progressBarData[index]['value'],
                                            initialRating: progressBarData[index]['initialRating'],
                                            itemCountStar: progressBarData[index]['itemCountStar']
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Center(
                              child: ListView.separated(
                                  separatorBuilder: (_, __) => Center(child: Text("------------------------------------")),
                                  scrollDirection: Axis.vertical,
                                  itemCount: 18,
                                  itemBuilder: (context, i) {
                                    return  Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 50,
                                              height:50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/attractive-stylish-blonde-woman-beige-coat-walking-street-against-vintage-wall_285396-8100.jpg"),fit: BoxFit.cover),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("محمود عبده",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
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
                                                    ],),
                                                  SizedBox(height: 5,),
                                                  Container(width: MediaQuery.of(context).size.width,
                                                      child: Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),)),
                                                ],
                                              ),
                                            ),
                                          ]
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          GridView.builder(
                            itemCount:7,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .6,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                            itemBuilder: (ctx, index) {
                              return  InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => SpecialOfferDetailsScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height:160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/portrait-glad-pretty-woman-dark-sweater-standing-near-lamps_114579-81862.jpg"),fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                            top:10 ,
                                            right: 10,
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
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: Center(child: Text("-20%",style: TextStyle(color: Colors.white),),),
                                            )),


                                        Positioned(
                                          top:180 ,
                                          right: 5,
                                          left: 5,
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Directionality(
                                                textDirection: TextDirection.rtl
                                                ,child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
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
                                              Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("15\$",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),),
                                                  SizedBox(width: 5,),
                                                  Text("12\$",style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.bold),),

                                                ],)
                                            ],),
                                        )

                                      ]
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(15) ,topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 8,
                    blurRadius: 8,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child:  Container(
                  width: MediaQuery.of(context).size.width-30,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(getColorHexFromStr("#009DDD"))
                  ),
                  child: Center(child: Text("شراء الان",style: TextStyle(color: Colors.white,fontSize: 20),),),
                ) ,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
final List<String> imgList = [
  'https://image.freepik.com/free-photo/young-beautiful-woman-casual-outfit-isolated-studio_1303-20526.jpg',
  'https://image.freepik.com/free-photo/young-woman-black-hat-using-phone_1303-26388.jpg',
  'https://image.freepik.com/free-photo/pretty-woman-sitting-cafe-china-town-talking-phone_1303-27868.jpg',
  "https://image.freepik.com/free-photo/stylish-businesswoman-25-years-old-white-coat-background-street-with-shops_143465-354.jpg",
];