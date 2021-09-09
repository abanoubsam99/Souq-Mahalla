import 'package:flutter/material.dart';
class verifiedCodeTextFild extends StatelessWidget {
   String hint;
   bool secure;
   TextInputType textInputType;
   Function  onclick;
  TextEditingController textEditingController;
  String _errorMessage(String error) {
    switch (hint) {
      case "ادخل البريد الالكترونى":
        return "يجب كنابة البريد الالكترونى";
    }
    return hint;
  }
  verifiedCodeTextFild({@required this.textEditingController,@required this.hint,@required this.secure, @required this.textInputType,@required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return _errorMessage(hint);
              }
            },
            onSaved: onclick,
            obscureText: secure,
            keyboardType: textInputType,
            controller: textEditingController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(.3),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                borderSide: BorderSide(
                  color:Colors.red,
                ),
              ),
              focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                borderSide: BorderSide(
                  color:Theme.of(context).primaryColor,
                ),
              ) ,
              hintText: hint,
              hintStyle:  TextStyle(color: Colors.white,fontSize: 17),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                borderSide: BorderSide(
                  color:Colors.white,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                borderSide: BorderSide(
                    color:Colors.white
                ),
              ),

            ),
            style: TextStyle(color:  Colors.white,fontSize: 20),

          ),
        ),
      ),
    );
  }
}
