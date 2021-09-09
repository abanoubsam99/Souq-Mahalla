import 'package:flutter/material.dart';
class BankTextFormField extends StatelessWidget {
  String hint;
  TextInputType textInputType;
  Function   onclick;
  TextEditingController textEditingController;
  String _errorMessage(String error) {
    switch (hint) {
      case "Name on Card":
        return "Name on Card Error";
    }
    return hint;
  }
  BankTextFormField({@required this.hint,@required this.onclick,@required this.textEditingController,@required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            onSaved: onclick,
            decoration:  InputDecoration(
             // filled: true,
             // fillColor: Colors.white.withOpacity(.3),
              hintText: hint,
              labelText: hint,
              hintStyle:  TextStyle(color: Colors.white,fontSize: 17),
              labelStyle: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return _errorMessage(hint);
              }
            },
          ),
        ),
      ),
    );
  }
}