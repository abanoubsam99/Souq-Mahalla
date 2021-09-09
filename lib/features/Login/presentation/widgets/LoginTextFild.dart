import 'package:flutter/material.dart';
class LoginTextFild extends StatelessWidget {
   String hint;
   bool secure;
   IconData icon;
   TextInputType textInputType;
   Function  onclick;
  TextEditingController textEditingController;
  String _errorMessage(String error) {
    switch (hint) {
      case "اسم المستخدم":
        return "يجب كنابة اسم المستخدم";
           case "كلمة المرور":
        return "يجب كنابة كلمة المرور";
    }
    return hint;
  }
  LoginTextFild({@required this.textEditingController,@required this.hint,@required this.secure,@required this.icon, @required this.textInputType,@required this.onclick});

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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    color:Colors.red,
                  ),
                ),
                focusedErrorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    color:Theme.of(context).primaryColor,
                  ),
                ) ,
                labelText: hint,
                hintText: hint,
                hintStyle:  TextStyle(color: Colors.white,fontSize: 17),
                labelStyle: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    color:Colors.white,
                  ),
                ),
                prefixIcon: Icon(icon,color: Colors.white,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                      color:Colors.white
                  ),
                ),

              ),
              style: TextStyle(color:  Colors.white,fontSize: 20),

            ),
          ),
        ),
      ),
    );
  }
}
