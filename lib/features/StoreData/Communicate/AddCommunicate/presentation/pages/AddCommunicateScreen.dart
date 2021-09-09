import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/Communicate/AddCommunicate/presentation/widgets/AddCommunicateTextFild.dart';
import 'package:untitled9/features/StoreData/Communicate/Communicate/presentation/pages/CommunicateScreen.dart';
class AddCommunicateScreen extends StatefulWidget {
  @override
  _AddCommunicateScreenState createState() => _AddCommunicateScreenState();
}

class _AddCommunicateScreenState extends State<AddCommunicateScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController details=TextEditingController();

  String _name,_details;
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
          "اضافة وسيلة تواصل",
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
            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: _imagecover==null ? NetworkImage("https://image.freepik.com/free-photo/old-cement-wall-texture_1149-1280.jpg")
                            :FileImage(_imagecover),
                        fit: BoxFit.cover
                    )
                ),
                child: Center(child: RaisedButton(
                  color: Colors.transparent,
                  onPressed:(){
                    getImageProduct();
                  },
                  child: Text("اضافة صورة",
                    style:TextStyle(color: Colors.white) ,),
                ),),
              ),
            ),
            AddCommunicateTextFild(
              hint: "نوع وسيلة التواصل",
              textEditingController:name,
              textInputType: TextInputType.text,
              onclick: (value) {  _name = value;},
            ),
            AddCommunicateTextFild(
              hint: "وصف وسيلة التواصل",
              textEditingController:details,
              textInputType: TextInputType.text,
              onclick: (value) {  _details = value;},
            ),


            SizedBox(height: 10,),

            InkWell(
              onTap: (){
                setState(() {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => CommunicateScreen()));
                  } else {
                    print("Add MyServices validator error");
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
                child: Center(child: Text("إضافة ",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 15,)

          ],),
        ),
      ),
    );
  }
}
