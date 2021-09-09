import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/MyProducts/MyProducts/presentation/pages/MyProductsScreen.dart';
import 'package:untitled9/features/StoreData/Offers/AddOffer/presentation/widgets/AddOfferTextFild.dart';

class AddOfferScreen extends StatefulWidget {

  @override
  _AddOfferScreenState createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController details=TextEditingController();
  TextEditingController startDate=TextEditingController();
  TextEditingController endDate=TextEditingController();
  TextEditingController beforePrice=TextEditingController();
  TextEditingController afterPrice=TextEditingController();

  String _name,_price,_details,_startDate,_endDate,_beforePrice,_afterPrice;
  File _imagecover;
  final pickercover = ImagePicker();
  String base64Str='';
  Future getImageProduct() async {
    final pickedFile = await pickercover.pickImage(source: ImageSource.gallery);
    setState(()  {
      _imagecover = File(pickedFile.path);
      print(_imagecover);
      final bytes = _imagecover.readAsBytesSync();
      base64Str = base64Encode(bytes);
      print(base64Str);
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "اضافة عرض",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 217,
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          _imagecover==null ?NetworkImage("https://image.freepik.com/free-vector/new-season-banner-template_1361-1221.jpg")
                              :FileImage(_imagecover),
                              fit: BoxFit.cover)
                      )
                  ),


                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 217,
                    color: Colors.black.withOpacity(.2),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Center(
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          getImageProduct();
                        },
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(getColorHexFromStr("#009DDD")),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.upload_sharp,color: Colors.white,size: 30,)

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AddOfferTextFild(
                hint: "اسم العرض",
                textEditingController:name,
                textInputType: TextInputType.text,
              onclick: (value) {  _name = value;},
            ),
            AddOfferTextFild(
              hint: "السعر",
              textEditingController:price,
              textInputType: TextInputType.number,
              onclick: (value) {  _price = value;},
            ),
            AddOfferTextFild(
              hint: "تاريخ البداية",
              textEditingController:startDate,
              textInputType: TextInputType.datetime,
              onclick: (value) {  _startDate = value;},
            ),
            AddOfferTextFild(
              hint: "تاريخ النهاية",
              textEditingController:endDate,
              textInputType: TextInputType.datetime,
              onclick: (value) {  _endDate = value;},
            ),
            AddOfferTextFild(
              hint: "السعر قبل",
              textEditingController:beforePrice,
              textInputType: TextInputType.number,
              onclick: (value) {  _beforePrice = value;},
            ),
            AddOfferTextFild(
              hint: "السعر قبل",
              textEditingController:afterPrice,
              textInputType: TextInputType.number,
              onclick: (value) {  _afterPrice = value;},
            ),
            AddOfferTextFild(
              hint: "وصف العرض",
              textEditingController:details,
              textInputType: TextInputType.multiline,
              onclick: (value) {  _details = value;},
            ),

            SizedBox(height: 10,),

            InkWell(
              onTap: (){
                setState(() {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => MyProductsScreen()));
                  } else {
                    print("Add Product validator error");
                  }
                });

              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(getColorHexFromStr("#009DDD"))
                ),
                child: Center(child: Text("إضافة عرض",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 15,)

          ],),
        ),
      ),
    );
  }
}
