import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/AppEvaluation/presentation/widgets/EvaluationDialog.dart';
import 'package:untitled9/features/AppEvaluation/presentation/widgets/ProgressBars.dart';
class AppEvaluationScreen extends StatefulWidget {

  @override
  _AppEvaluationScreenState createState() => _AppEvaluationScreenState();
}

class _AppEvaluationScreenState extends State<AppEvaluationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "تقييم التطبيق",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('4.4',style: TextStyle(fontSize: 40,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.bold),),
                  Text("23 Ratings",style: TextStyle(fontSize: 13,color: Colors.black.withOpacity(0.5),decoration: TextDecoration.none),textDirection: TextDirection.ltr,)
                ],
              ),
              SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width/2+50,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx,index){
                    return ProgressBars(
                      num: progressBarData[index]['num'],
                      value: progressBarData[index]['value'],
                      initialRating: progressBarData[index]['initialRating'],
                      itemCountStar: progressBarData[index]['itemCountStar']
                    );
                  },
                ),
              )
            ],
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('  الاراء 18 ',style: TextStyle(fontSize: 20,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.bold),),
            ],
          ),

          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.separated(
                  separatorBuilder: (_, __) => Center(child: Text("------------------------------------")),
                  scrollDirection: Axis.vertical,
                  itemCount: 18,
                  itemBuilder: (context, i) {
                    return  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height:50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/portrait-elegant-brutal-man-wool-suit_149155-478.jpg"),fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("محمود عبده",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                      Container(
                                        width: 55,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Color(getColorHexFromStr("#5663FF")).withOpacity(.1),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center
                                          ,children: [
                                            Text("4.5",style: TextStyle(color: Colors.black),),
                                            Icon(Icons.star,color: Colors.amber,size: 17,),
                                          ],
                                        ),
                                      ),
                                    ],),
                                  SizedBox(height: 5,),
                                  Container(width: MediaQuery.of(context).size.width,
                                      child: Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة",style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),)),
                                ],
                              ),
                            ),
                          ]
                      ),
                    );
                  }),
            ),
          ),
SizedBox(height: 3,),
          InkWell(
            onTap: (){
              // bottomSheetEvaluation(context: context);
              showEvaluationDialog(context: context);
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Container(
                  width: 125,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(getColorHexFromStr("#009DDD")),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit,color: Colors.white,size: 17,),
                      Text("اضافة تقييم",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 3,),


        ],),
      ),
    );
  }

}
