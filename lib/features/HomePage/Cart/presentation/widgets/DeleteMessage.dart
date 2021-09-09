import 'package:flutter/material.dart';

Future<bool> DeleteMessage(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("تأكيد المسح",style: TextStyle(color: Colors.red),),
        ],
      ),
      content: Text("هل انت متأكد من مسح هذا المنتج "),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text('لا'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text('نعم'),
        ),
      ],
    ),
  )) ?? false;
}