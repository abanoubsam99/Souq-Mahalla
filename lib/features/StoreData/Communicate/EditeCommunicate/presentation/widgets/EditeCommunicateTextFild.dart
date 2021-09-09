import 'package:flutter/material.dart';
class EditeCommunicateTextFild extends StatelessWidget {
   String hint;
   TextInputType textInputType;
    Function   onclick;
  TextEditingController textEditingController;
  String _errorMessage(String error) {
    switch (hint) {
      case "نوع وسيلة التواصل":
        return "يجب كنابة نوع وسيلة التواصل";
      case "وصف وسيلة التواصل":
        return "يجب كنابة وصف وسيلة التواصل";
    }
    return hint;
  }
   EditeCommunicateTextFild({@required this.textEditingController,@required this.hint, @required this.textInputType,@required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return _errorMessage(hint);
                }
              },
              onSaved: onclick,
              obscureText: false,
              minLines: 1,
              maxLines: 7,
              keyboardType: textInputType,
              controller: textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(.3),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color:Colors.red,
                  ),
                ),
                focusedErrorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color:Theme.of(context).primaryColor,
                  ),
                ) ,
                labelText: hint,
                hintText: hint,
                hintStyle:  TextStyle(color: Colors.grey,fontSize: 12),
                labelStyle: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color:Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color:Colors.grey
                  ),
                ),

              ),
              style: TextStyle(color:  Colors.black,fontSize: 12),

            ),
          ),
        ),
      ),
    );
  }
}
