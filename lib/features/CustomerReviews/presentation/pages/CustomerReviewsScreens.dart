import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
class CustomerReviewsScreens extends StatefulWidget {

  @override
  _CustomerReviewsScreensState createState() => _CustomerReviewsScreensState();
}

class _CustomerReviewsScreensState extends State<CustomerReviewsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  ListView.separated(
          separatorBuilder: (_, __) => Center(child: Text("------------------------------------")),
          scrollDirection: Axis.vertical,
          itemCount: 20,
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
    );
  }
}
