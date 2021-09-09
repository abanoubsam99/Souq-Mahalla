import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/EditeProfile/presentation/widgets/EditeProfileTextFormField.dart';
class EditeProfileScreen extends StatefulWidget {
  @override
  _EditeProfileScreenState createState() => _EditeProfileScreenState();
}

class _EditeProfileScreenState extends State<EditeProfileScreen> {

  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController email=TextEditingController();

  String _name,_phone,_pass,_email,_address;


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
          "تعديل بروفايل",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Center(
              child: Stack(children: [
                Container(
                  width: 110,
                  height: 110,
                ),
                Container(
                  width: 99,
                  height: 99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(image:
                    _imagecover==null ?NetworkImage("https://image.freepik.com/free-photo/businessman-adjust-necktie-his-suit_105092-112.jpg")
                    :FileImage(_imagecover),
                    fit: BoxFit.cover)
                  ),
                ),
                Positioned(
                  right: 9,
                  bottom: 9,
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,

                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: InkWell(
                    onTap: (){
                      getImageProduct();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        color: Color(getColorHexFromStr("#009DDD")),
                      ),
                      child: Center(
                        child:  Icon(Icons.upload_sharp,color: Colors.white,),
                      ),
                    ),
                  ),
                ),


              ],),
            ),

            EditeProfileTextFormField(
              textEditingController:name,
                hint: "الاسم",
                secure: false,
                icon: Icons.person_outline,
                textInputType: TextInputType.text,
                onclick: (value) {  _name = value;},
            ),
            EditeProfileTextFormField(
              textEditingController:email,
              hint: "الايميل",
              secure: false,
              icon: Icons.email_outlined,
              textInputType: TextInputType.text,
              onclick: (value) {  _email = value;},
            ),
            EditeProfileTextFormField(
              textEditingController:pass,
              hint: "الرقم السري",
              secure: true,
              icon: Icons.lock_open,
              textInputType: TextInputType.text,
              onclick: (value) {  _pass = value;},
            ),
            EditeProfileTextFormField(
              textEditingController:phone,
              hint: "رقم التليفون",
              secure: false,
              icon: Icons.phone,
              textInputType: TextInputType.text,
              onclick: (value) {  _phone = value;},
            ),
            EditeProfileTextFormField(
              textEditingController:address,
              hint: "العنوان",
              secure: false,
              icon: Icons.location_on_outlined,
              textInputType: TextInputType.text,
              onclick: (value) {  _address = value;},
            ),

            SizedBox(height: 10,),

            InkWell(
              onTap: (){
                setState(() {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  Navigator.pop(context);
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
                child: Center(child: Text("حفظ التعديل",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 15,)

          ],),
        ),
      ),
    );
  }
}
