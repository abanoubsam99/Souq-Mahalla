import 'package:flutter/material.dart';
class AboutAppScreen extends StatefulWidget {

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "عن التطبيق",
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
            child: Image.network("https://image.freepik.com/free-photo/beautiful-railway-station-with-modern-high-speed-red-commuter-train-railroad-with-vintage-toning-train-railway-platform-industrial-concept_159067-52.jpg",
              fit: BoxFit.cover,),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("سوق المحلة",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
              Text("ــــــــــــــــــــــ",style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.bold),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text("وريم إيبسوم هو ببساطة نص شكلي بمعنى أن الغاية هي الشكل وليس المحتوى ويُستخدم في صناعات المطابع ودور النشر كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة",
              style: TextStyle(color: Colors.grey,fontSize: 13),),
            ),
          )

        ],),
      ),
    );
  }
}
