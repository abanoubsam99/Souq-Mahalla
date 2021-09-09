import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled9/Color.dart';
class StoreLogoScreen extends StatefulWidget {

  @override
  _StoreLogoScreenState createState() => _StoreLogoScreenState();
}

class _StoreLogoScreenState extends State<StoreLogoScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "لوجو المتجر",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
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
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("تغيير لوجو المتجر",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى ",
                  style: TextStyle(color: Colors.grey,fontSize: 13),),
              ),
            )

          ],),
      ),
    );
  }
}
