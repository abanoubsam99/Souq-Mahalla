import 'package:flutter/material.dart';

import 'package:untitled9/Color.dart';
import 'package:untitled9/features/OfferedProducts/presentation/pages/BrandScreen.dart';
import 'package:untitled9/features/OfferedProducts/presentation/widgets/CategorylistItems.dart';
import 'package:untitled9/features/OfferedProducts/presentation/widgets/FilterlistItems.dart';
import 'package:untitled9/features/OfferedProducts/presentation/widgets/SizelistItems.dart';
class FiltreScreen extends StatefulWidget {
  @override
  _FiltreScreenState createState() => _FiltreScreenState();
}

class _FiltreScreenState extends State<FiltreScreen> {
  RangeValues values = RangeValues(10, 70);
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("مدى السعر",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
          ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Text("0\$"),
          Expanded(child:
          RangeSlider(
            values: values,
            min: 0,
            max: 80,
            divisions: 20,
            labels: RangeLabels(
              values.start.round().toString(),
              values.end.round().toString(),
            ),
            onChanged: (values) => setState(() => this.values = values),
          ),),

          Text("80\$"),
        ],),
      ),


          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("اللون",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datafilter.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (ctx, index) {
                  return FilterlistItems(
                      color:  datafilter[index]['color'],
                      selected: datafilter[index]['isSelected'],
                      index: index,
                      function: (){
                        setState(() {
                          datafilter[index]['isSelected'] = !datafilter[index]['isSelected'];
                        });
                      }
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("الحجم",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datasize.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (ctx, index) {
                  return SizelistItems(
                      title:  datasize[index]['title'],
                      selected: datasize[index]['isSelected'],
                      index: index,
                      function: (){
                        setState(() {
                          datasize[index]['isSelected'] = !datasize[index]['isSelected'];
                        });
                      }
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("التصنيف",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataCategory.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (ctx, index) {
                  return CategorylistItems(
                      title:  dataCategory[index]['title'],
                      selected: dataCategory[index]['isSelected'],
                      index: index,
                      function: (){
                        setState(() {
                          dataCategory[_selectedCategory]['isSelected'] = false;
                          _selectedCategory = index;
                          dataCategory[_selectedCategory]['isSelected'] = true;

                        });
                      }
                  );
                }),
          ),


          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BrandScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الماركة",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                      Text("VIP Fashion Brands",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 12),),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,textDirection: TextDirection.ltr,),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(getColorHexFromStr("#009DDD")),
                ),
                child: Center(child: Text("تطبيق",style: TextStyle(color: Colors.white),)),
              ),
              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Colors.white,
                    border: Border.all(color: Colors.black)

                ),
                child: Center(child: Text("الغاء",style: TextStyle(color: Colors.black),)),
              ),
            ],),
          )



        ],),
      ),
    );
  }

}
