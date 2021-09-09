import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/HomePage/SpecialOffers/presentation/pages/SpecialOfferDetailsScreen.dart';
class SpecialOffersScreen extends StatefulWidget {

  @override
  _SpecialOffersScreenState createState() => _SpecialOffersScreenState();
}

class _SpecialOffersScreenState extends State<SpecialOffersScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  double _userRating = 3.0;
  IconData _selectedIcon;
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: GridView.builder(
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
    );
  }
}
