import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/MyProducts/EditeProduct/presentation/widgets/EditeProductTextFild.dart';
import 'package:untitled9/features/StoreData/MyProducts/MyProducts/presentation/pages/MyProductsScreen.dart';

class EditeProductScreen extends StatefulWidget {

  @override
  _EditeProductScreenState createState() => _EditeProductScreenState();
}

class _EditeProductScreenState extends State<EditeProductScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController details=TextEditingController();

  String _name,_price,_details;
  List<Asset> images = List<Asset>();
  Future<void> pickImages() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "اختر صور المنتج",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    setState(() {
      images = resultList;
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "تعديل منتج",
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Container(
                      width:70,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          NetworkImage("https://image.freepik.com/free-psd/glass-cosmetic-jar-mockup_358694-2724.jpg"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    Container(
                      width: 70,
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
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
            ),
           EditeProductTextFild(
                hint: "اسم المنتج",
                textEditingController:name,
                textInputType: TextInputType.text,
              onclick: (value) {  _name = value;},
            ),
            EditeProductTextFild(
              hint: "السعر",
              textEditingController:price,
              textInputType: TextInputType.number,
              onclick: (value) {  _price = value;},
            ),
            EditeProductTextFild(
              hint: "وصف المنتج",
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
                child: Center(child: Text("تعديل منتج",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 15,)

          ],),
        ),
      ),
    );
  }
}
