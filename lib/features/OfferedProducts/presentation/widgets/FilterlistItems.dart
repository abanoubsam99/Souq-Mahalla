import 'package:flutter/material.dart';

FilterlistItems({Color color, int index, bool selected,Function function}) {
  return InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent
    ,highlightColor: Colors.transparent,
    onTap: function,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: selected?Colors.red:Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

List<Map<String, dynamic>> datafilter = [
  {'color': Colors.red, 'isSelected': false,},
  {'color': Colors.green,'isSelected': false,},
  {'color': Colors.indigo,'isSelected': false,},
  {'color': Colors.black,'isSelected': true,},
  {'color':Colors.amber,'isSelected': false,},
  {'color':Colors.brown,'isSelected': false,},
  {'color':Colors.teal,'isSelected': false,},
];
