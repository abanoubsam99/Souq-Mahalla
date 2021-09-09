import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/FeaturedStores/presentation/pages/FeaturedStoresDetailsScreen.dart';
import 'package:untitled9/features/FeaturedStores/presentation/pages/FeaturedStoresScreen.dart';
import 'package:untitled9/features/HomePage/Sections/presentation/pages/SectionsDetailsScreen.dart';
import 'package:untitled9/features/HomePage/Sections/presentation/pages/SectionsScreen.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOfferDetailsScreen.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOffersScreen.dart';
import 'package:untitled9/features/LatestProducts/presentation/pages/LatestProductsDetailsScreen.dart';
import 'package:untitled9/features/LatestProducts/presentation/pages/LatestProductsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  double _userRating = 3.0;
  IconData _selectedIcon;
  bool _isVertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Container(
                                      width:MediaQuery.of(context).size.width ,
                                      height: MediaQuery.of(context).size.height,
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      right: 50.0,
                                      bottom: 0.0,
                                      child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'عروض خاصة',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "خصم على  موبيلات الايفون",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            width: 120,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: Color(getColorHexFromStr(
                                                    "#15233D")),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          child: Center(child: Text("اشترى الان",style: TextStyle(color: Colors.white),),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      carouselController: _controller,
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
                    ),
                  ),
                ),
                Row(
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
                                        : _current == entry.key ? Colors.blue : Colors.black26 )
                                    ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("الاقسام",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  Text("------------",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  Text("تعدد الاقسام",style: TextStyle(color: Color(getColorHexFromStr("#8A9EAD")),fontSize: 12,fontWeight: FontWeight.normal),)
              ],),
                ),
                SizedBox(width: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SectionsScreen()));
                  },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
                ),

              ],),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SectionsDetailsScreen(title: _dataitem[i]['title'],)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                          width: MediaQuery.of(context).size.width/3,
                          height:80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(image: NetworkImage(_dataitem[i]['imageUrl']),fit: BoxFit.cover),
                          ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                    colors: [
                                      _dataitem[i]['color'],
                                      _dataitem[i]['color2'],
                                    ])                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3,
                            height:80,
                            child: Center(child: Text(_dataitem[i]['title'],style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.normal),)
                              ,),
                          ),

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("عروض خاصة",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("----------------",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("تستمر لفترة محدوده",style: TextStyle(color: Color(getColorHexFromStr("#8A9EAD")),fontSize: 12,fontWeight: FontWeight.normal),)
                    ],),
                ),
                SizedBox(width: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SpecialOffersScreen()));
                  },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
                ),
              ],),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 270,
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
                              height:140,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg"),fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                                top:100 ,
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
                              top:150 ,
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



          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("متاجر مميزه",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("----------------",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("تعدد الاقسام",style: TextStyle(color: Color(getColorHexFromStr("#8A9EAD")),fontSize: 12,fontWeight: FontWeight.normal),)
                    ],),
                ),
                SizedBox(width: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => FeaturedStoresScreen()));
                  },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
                ),
              ],),
          ),

          Container(
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


          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("احدث المنتجات",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("----------------",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Text("تستمر لفترة محدوده",style: TextStyle(color: Color(getColorHexFromStr("#8A9EAD")),fontSize: 12,fontWeight: FontWeight.normal),)
                    ],),
                ),
                SizedBox(width: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LatestProductsScreen()));
                  },child: Text("شاهد الكل ( 25 )",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 10))),
                ),
              ],),
          ),

          Directionality(
            textDirection: TextDirection.rtl,

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => LatestProductsDetailsScreen()));
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
                                height:140,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-vector/summer-colection-banner-with-hand-drawn-flowers_1188-312.jpg"),fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                  top:100 ,
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
                                top:150 ,
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


          SizedBox(height: 20,),





        ],
      ),
    );
  }
  List<Map<String, dynamic>> _dataitem = [
    {
      'title': 'الكترونيات',
      'imageUrl': "https://image.freepik.com/free-vector/circuit-board-background_52683-6671.jpg",
      'color':Color(getColorHexFromStr("#64B6FF")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#667EEA")).withOpacity(.75),


    },
    {
      'title': 'ملابس رجالى',
      'imageUrl': "https://image.freepik.com/free-photo/interior-shot-racks-with-shirts-undershirts-jeans_88135-5869.jpg",
      'color':Color(getColorHexFromStr("#FF4665")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#832BF6")).withOpacity(.75),

    },
    {
      'title': 'ملابس حريمى',
      'imageUrl': "https://image.freepik.com/free-photo/shop-clothing-clothes-shop-hanger-modern-shop-boutique_1150-8886.jpg",
      'color':Color(getColorHexFromStr("#3B40FE")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#2DCEF8")).withOpacity(.75),

    },
    {
      'title': 'موبيلات ',
      'imageUrl': "https://image.freepik.com/free-psd/smartphone-clay-mockup_165789-425.jpg",
      'color':Color(getColorHexFromStr("#21E590")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#009DC5")).withOpacity(.75),

    },
    {
      'title': 'اكسسوارات',
      'imageUrl': "https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg",
      'color':Color(getColorHexFromStr("#D236D2")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#FF870E")).withOpacity(.75),

    },
    {
      'title': 'احذية',
      'imageUrl': "https://image.freepik.com/free-photo/shoemaker-workshop-making-shoes_171337-12277.jpg",
      'color':Color(getColorHexFromStr("#5C51FF")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#FE327E")).withOpacity(.75),

    },
    {
      'title': 'ملابس',
      'imageUrl': "https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg",
      'color':Color(getColorHexFromStr("#6143FF")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#2CE3F1")).withOpacity(.75),

    },
  ];

}
final List<String> imgList = [
  'https://image.freepik.com/free-photo/female-person-hands-drags-cart-full-goods-supermarket-shopping-customer-shop-buyer-market-shopping-concept_266732-5714.jpg',
  'https://image.freepik.com/free-photo/shopping-cart-shelves-food-store_266732-4160.jpg',
  'https://image.freepik.com/free-vector/flat-abstract-sales-banner-with-offer_23-2149020199.jpg',
  'https://image.freepik.com/free-vector/realistic-three-dimensional-sales-background_23-2148961125.jpg',
  'https://image.freepik.com/free-vector/gradient-summer-sale-banner-with-photo_23-2148942890.jpg',
  'https://image.freepik.com/free-vector/super-sale-with-special-price_23-2148960121.jpg'
];