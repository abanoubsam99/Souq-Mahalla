import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';


CategorylistItems({String title, int index, bool selected,Function function}) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent
    ,highlightColor: Colors.transparent,
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 39,
        width: 100,
        decoration: BoxDecoration(
            color: selected? Color(getColorHexFromStr("#009DDD")):Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selected?Color(getColorHexFromStr("#009DDD")):Colors.grey)
        ),
        child: Center(
          child: Text(title,style: TextStyle(color: selected?Colors.white:Colors.black),),
        ),
      ),
    ),
  );
}
List<Map<String, dynamic>> dataCategory = [
  {'title': "الكل", 'isSelected': true,},
  {'title':"رجالى",'isSelected': false,},
  {'title': "حريمى",'isSelected': false,},
  {'title': "اولاد",'isSelected': false,},
  {'title':"بنات",'isSelected': false,},
];