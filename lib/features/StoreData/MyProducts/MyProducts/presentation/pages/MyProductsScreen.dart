import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/MyProducts/AddProduct/presentation/pages/AddProductScreen.dart';
import 'package:untitled9/features/StoreData/MyProducts/EditeProduct/presentation/pages/EditeProductScreen.dart';
import 'package:untitled9/features/StoreData/MyProducts/MyProducts/presentation/widgets/SearchProductTextFild.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOfferDetailsScreen.dart';
class MyProductsScreen extends StatefulWidget {

  @override
  _MyProductsScreenState createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  double _userRating = 3.0;
  IconData _selectedIcon;
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "منتجاتى",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.search,color: Colors.grey,),
                  SizedBox(width: 15,),
                  Expanded(
                    child: SearchProductTextFild(
                    ),
                  ),

                ],),
            ),
          ),
        ),
        Expanded(child: GridView.builder(
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
                          image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg"),fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          top:10 ,
                          right: 10,
                          child:
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color:  Color(getColorHexFromStr("#009DDD")),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(child: IconButton(onPressed: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => EditeProductScreen()));
                            }, icon: Icon(Icons.edit,color: Colors.white,size: 20,)),),
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
        ),),
        SizedBox(height: 10,),

        InkWell(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProductScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width-30,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(getColorHexFromStr("#009DDD"))
            ),
            child: Center(child: Text("إضافة منتج",style: TextStyle(color: Colors.white,fontSize: 20),),),
          ),
        ),
        SizedBox(height: 15,)

      ],),
    );
  }
}
