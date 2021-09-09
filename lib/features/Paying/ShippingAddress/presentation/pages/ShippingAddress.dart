import 'package:flutter/material.dart';
import 'package:untitled9/features/Paying/AddNewAddress/presentation/pages/AddNewAddress.dart';
import 'package:untitled9/Color.dart';
class ShippingAddress extends StatefulWidget {
  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  int _selectedShippingAddress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child:  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dataShippingAddress.length,
              padding: EdgeInsets.all(5),
              itemBuilder: (ctx, index) {
                return ShippingAddressItem(
                    title:  dataShippingAddress[index]['title'],
                    selected: dataShippingAddress[index]['isSelected'],
                    index: index,
                    function: (){
                      setState(() {
                        dataShippingAddress[_selectedShippingAddress]['isSelected'] = false;
                        _selectedShippingAddress = index;
                        dataShippingAddress[_selectedShippingAddress]['isSelected'] = true;

                      });
                    }

                );
              }),
          ),
        ],),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAddressScreen()));

            },
            child:Icon(Icons.add,color: Colors.white,),
            backgroundColor: Color(getColorHexFromStr("#009DDD"))
        ),
      ),

    );
  }

  ShippingAddressItem({String title, int index, bool selected,Function function}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent
      ,highlightColor: Colors.transparent,
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("محافظة الدقهلية",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                          InkWell(onTap: (){
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ShippingAddress()));

                          },child: Text("تغيير",style: TextStyle(color: Color(getColorHexFromStr("#009DDD")),fontWeight: FontWeight.bold,fontSize: 14),)),
                        ],),
                      Text("هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent
                        ,highlightColor: Colors.transparent,
                        onTap: function,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: selected,
                                  activeColor: selected?Colors.black:Colors.grey,
                                  onChanged: (bool val){
                                    setState(() {
                                      dataShippingAddress[_selectedShippingAddress]['isSelected'] = false;
                                      _selectedShippingAddress = index;
                                      dataShippingAddress[_selectedShippingAddress]['isSelected'] = true;
                                    });
                                  },
                                ),
                                Text("استخدام هذا العنوان",style: TextStyle(color: selected?Colors.black:Colors.grey,fontWeight: FontWeight.bold),),
                              ],)
                        ),
                      )
                    ],),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Map<String, dynamic>> dataShippingAddress = [
    {'isSelected': true,},
    {'isSelected': false,},
    {'isSelected': false,},
    {'isSelected': false,},
  ];
}
