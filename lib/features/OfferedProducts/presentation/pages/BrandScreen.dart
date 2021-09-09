import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/OfferedProducts/presentation/widgets/SearchTextFild.dart';
class BrandScreen extends StatefulWidget {
  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(getColorHexFromStr("#F9F9F9")),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Icon(Icons.search,color: Colors.grey,),
                SizedBox(width: 5,),
                Expanded(
                  child: SearchTextFild(
                  ),
                )
              ],),
            ),
          ),

          Expanded(child:  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _datasearch.length,
              padding: EdgeInsets.all(5),
              itemBuilder: (ctx, index) {
                return SearchlistItems(
                    title:  _datasearch[index]['title'],
                    selected: _datasearch[index]['isSelected'],
                    index: index,
                    function: (){
                      setState(() {
                        _datasearch[index]['isSelected'] = !_datasearch[index]['isSelected'];
                      });
                    }
                );
              }),),



          Padding(
            padding: const EdgeInsets.all(10),
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

  SearchlistItems({String title, int index, bool selected,Function function}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent
      ,highlightColor: Colors.transparent,
      onTap: function,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(title,style: TextStyle(color: selected?Color(getColorHexFromStr("#009DDD")):Colors.black,fontWeight: FontWeight.bold),),
            Checkbox(
              value: selected,
              activeColor: selected?Color(getColorHexFromStr("#009DDD")):Colors.black,
              onChanged: (bool val){
                setState(() {
                  _datasearch[index]['isSelected'] = !_datasearch[index]['isSelected'];
                });
              },
            ),


          ],)
      ),
    );
  }

  List<Map<String, dynamic>> _datasearch = [
    {'title': "FENDI", 'isSelected': false,},
    {'title':"HOUSE OF VERSACE",'isSelected': true,},
    {'title': "BURBERRY",'isSelected': false,},
    {'title':"RALPH LAUREN",'isSelected': false,},
    {'title':"CHANEL",'isSelected': false,},
    {'title':"PRADA",'isSelected': true,},
    {'title':"HERMES",'isSelected': false,},
  ];
}
