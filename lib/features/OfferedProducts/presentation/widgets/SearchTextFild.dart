import 'package:flutter/material.dart';
class SearchTextFild extends StatelessWidget {
  String hint="عمل اقتراح او شكوى";
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            decoration:  InputDecoration(
              hintText: 'ابحث',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
          //    hintMaxLines: 5,
              // labelText: 'Name *',
            ),

            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (value) {
              if (value.isEmpty) {
                return "يجب كتابه شئ للبحث عنه";
              }
            },
          ),
        ),
      ),
    );
  }
}