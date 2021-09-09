import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';

SizelistItems({String title, int index, bool selected,Function function}) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent
    ,highlightColor: Colors.transparent,
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
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
List<Map<String, dynamic>> datasize = [
  {'title': "XL", 'isSelected': false,},
  {'title':"L",'isSelected': false,},
  {'title': "M",'isSelected': false,},
  {'title': "S",'isSelected': true,},
  {'title':"XS",'isSelected': false,},
];
