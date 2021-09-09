import 'package:flutter/material.dart';
class AddAddressTextFild extends StatelessWidget {
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
  AddAddressTextFild({@required this.hint,@required this.onclick,@required this.textEditingController,@required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textEditingController,
                keyboardType: textInputType,
                onSaved: onclick,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(.3),
                  hintText: hint,
                  labelText: hint,
                  hintStyle:  TextStyle(color: Colors.white,fontSize: 17),
                  labelStyle: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color:Colors.white
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color:Colors.white,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color:Colors.red,
                    ),
                  ),
                  //  disabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return _errorMessage(hint);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}