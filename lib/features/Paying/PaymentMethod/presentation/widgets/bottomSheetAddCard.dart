import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';

bottomSheetbottomSheetAddCard({@required BuildContext context}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
      context: context,
      elevation: 0,
      builder: (context) {
        return addCard();
      });
}
class addCard extends StatefulWidget {
  @override
  _addCardState createState() => _addCardState();
}

class _addCardState extends State<addCard> {
  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController cvv=TextEditingController();

  String _name,_date,_number,_cvv;
  bool selected=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Color(getColorHexFromStr("#F9F9F9")),
          borderRadius: BorderRadius.only(topRight:Radius.circular(25) ,topLeft: Radius.circular(25))
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("اضافة كارت جديد",style: TextStyle(color: Colors.black,fontSize: 16),),
            Expanded(child:ListView(children: [
              AddCardTextFild(
                hint: "Name on Card",
                textEditingController:name ,
                textInputType: TextInputType.text,
                onclick: (value) {  _name = value;
                },
              ),
              AddCardTextFild(
                hint: "Card Number",
                textEditingController:number ,
                textInputType: TextInputType.number,
                onclick: (value) {  _number = value;
                },
              ),
              AddCardTextFild(
                hint: "Expire Date",
                textEditingController:date ,
                textInputType: TextInputType.datetime,
                onclick: (value) {  _date = value;
                },
              ),
              AddCardTextFild(
                hint: "CVV",
                textEditingController:cvv ,
                textInputType: TextInputType.number,
                onclick: (value) {  _cvv = value;
                },
              ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: InkWell(
                onTap: (){
                  setState(() {
                    selected=!selected;
                  });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: selected,
                        activeColor: selected?Colors.black:Colors.grey,
                        onChanged: (bool val){
                          setState(() {
                            selected=!selected;
                          });
                        },
                      ),
                      Text("استخدام هذه البطاقة الائتمانية",style: TextStyle(color: selected?Colors.black:Colors.grey,fontWeight: FontWeight.bold),),
                    ],),
                ),
            )

            ],)),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(getColorHexFromStr("#009DDD"))
                ),
                child: Center(child: Text("إضافة البطاقة",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardTextFild extends StatelessWidget {
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
   AddCardTextFild({@required this.hint,@required this.onclick,@required this.textEditingController,@required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 65,
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
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                        color:Colors.white
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                      color:Colors.white,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
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
