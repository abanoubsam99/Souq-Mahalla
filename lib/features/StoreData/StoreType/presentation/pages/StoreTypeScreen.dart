import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/StoreType/presentation/widgets/StoreTypeTextFild.dart';
import 'package:untitled9/features/StoreData/StoreType/presentation/widgets/TypeCustomDropdown.dart';
class StoreTypeScreen extends StatefulWidget {

  @override
  _StoreTypeScreenState createState() => _StoreTypeScreenState();
}

class _StoreTypeScreenState extends State<StoreTypeScreen> {
  TextEditingController type=TextEditingController();
  TextEditingController details=TextEditingController();
  String _type,_details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "نوع المتجر و وصفه",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(children: [
            TypeCustomDropdown(),
            StoreTypeTextFild(
              hint: "وصف المتجر",
              textEditingController:details,
              textInputType: TextInputType.multiline,
              onclick: (value) {  _details = value;},
            ),

            InkWell(
              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => PayingScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(getColorHexFromStr("#009DDD"))
                ),
                child: Center(child: Text("تحديث البيانات",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
            SizedBox(height: 10,)
    ],),
        )
      )
    );
  }
}
