import 'package:flutter/material.dart';
class EditeProfileTextFormField extends StatelessWidget {
  String hint;
  bool secure;
  IconData icon;
  TextInputType textInputType;
  Function   onclick;
  TextEditingController textEditingController;
  String _errorMessage(String error) {
    switch (hint) {
      case "الاسم":
        return "يجب كنابة الاسم";
      case "الايميل":
        return "يجب كنابة الايميل";
      case "الرقم السري":
        return "يجب كنابة الرقم السري";
      case "رقم التليفون":
        return "يجب كنابة رقم التليفون";
      case "العنوان":
        return "يجب كنابة العنوان";
    }
    return hint;
  }
  EditeProfileTextFormField({@required this.textEditingController,@required this.hint,@required this.secure,@required this.icon, @required this.textInputType,@required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 60,
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

                labelText: hint,
                hintText: hint,
                hintStyle:  TextStyle(color: Colors.black,fontSize: 12),
                labelStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
                prefixIcon: Icon(icon,color: Colors.black,),
              ),
              style: TextStyle(color:  Colors.black,fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
