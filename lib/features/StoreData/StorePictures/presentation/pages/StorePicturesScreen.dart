import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

class StorePicturesScreen extends StatefulWidget {

  @override
  _StorePicturesScreenState createState() => _StorePicturesScreenState();
}

class _StorePicturesScreenState extends State<StorePicturesScreen> {
  List<Asset> images = List<Asset>();
  Future<void> pickImages() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "اختر صور المتجر",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    setState(() {
      images = resultList;
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
          "صور المتجر",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(image:
                      NetworkImage("https://image.freepik.com/free-psd/reflecting-logo-office-wall_117023-1653.jpg"),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    width:70,
                    height: 70,
                    color: Colors.black.withOpacity(.2),
                    child: IconButton(onPressed: (){
                      pickImages();
                    },
                      icon:  Icon(Icons.upload_sharp,color: Colors.white,size: 30,),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: AssetThumb(
                      asset: asset,
                      width: 300,
                      height: 300,
                    ),
                  );
                }),
              ),
            )
          ],),
      ),
    );
  }
}
