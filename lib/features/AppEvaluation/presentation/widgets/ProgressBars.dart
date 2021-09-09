import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class ProgressBars extends StatelessWidget {
  String num;
  double value,initialRating;
  int itemCountStar;
  IconData _selectedIcon;
  ProgressBars({@required this.initialRating,@required this.num,@required this.value,@required this.itemCountStar});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: MediaQuery.of(context).size.width/4-10,
            height: 13,
            margin:EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child:
            RatingBarIndicator(
              rating: initialRating,
              itemBuilder: (context, index) => Icon(
                _selectedIcon ?? Icons.star,
                color: Colors.amber,
              ),
              itemCount: itemCountStar,
              itemSize: 15.0,
              unratedColor: Colors.amber.withAlpha(50),
              direction:  Axis.horizontal,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width/4,
          height: 13,
          margin:EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              color: Colors.red,
              backgroundColor: Colors.white,
              value: value,
              minHeight: 15,
            ),
          ),
        ),
        Text(num,style: TextStyle(fontSize: 12,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.bold),),
      ],
    );
  }
}

List <Map<String,dynamic>> progressBarData=[
  {
    'num':'12',
    'value':1.0,
    'itemCountStar':5,
    'initialRating':5.0
  },
  {
    'num':'5',
    'value':0.7,
    'itemCountStar':4,
    'initialRating':4.0
  },
  {
    'num':'4',
    'value':0.5,
    'itemCountStar':3,
    'initialRating':3.0
  },
  {
    'num':'2',
    'value':0.3,
    'itemCountStar':2,
    'initialRating':2.0
  },
  {
    'num':'1',
    'value':0.1,
    'itemCountStar':1,
    'initialRating':1.0
  }
];
