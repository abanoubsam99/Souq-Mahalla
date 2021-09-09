import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/StoreData/Communicate/Communicate/presentation/pages/CommunicateScreen.dart';
import 'package:untitled9/features/StoreData/MyProducts/MyProducts/presentation/pages/MyProductsScreen.dart';
import 'package:untitled9/features/StoreData/MyServices/MyServices/presentation/pages/MyServicesScreen.dart';
import 'package:untitled9/features/StoreData/Offers/Offers/presentation/pages/OffersScreen.dart';
import 'package:untitled9/features/StoreData/StoreLogo/presentation/pages/StoreLogoScreen.dart';
import 'package:untitled9/features/StoreData/StorePictures/presentation/pages/StorePicturesScreen.dart';
import 'package:untitled9/features/StoreData/StoreType/presentation/pages/StoreTypeScreen.dart';


class StoreDataScreen extends StatefulWidget {
  @override
  _StoreDataScreenState createState() => _StoreDataScreenState();
}

class _StoreDataScreenState extends State<StoreDataScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "بيانات المتجر",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child:  ListView.separated(
                  separatorBuilder: (_, __) => Center(child: Text("------------------------------------",style: TextStyle(color: Colors.grey),)),
                  scrollDirection: Axis.vertical,
                  itemCount: _dataitem.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            i==0?   Navigator.push(
                                context, MaterialPageRoute(builder: (context) => StoreLogoScreen()))
                            :        i==1?   Navigator.push(
                                context, MaterialPageRoute(builder: (context) => StorePicturesScreen()))
                                :        i==2?   Navigator.push(
                                context, MaterialPageRoute(builder: (context) => StoreTypeScreen()))
                                :        i==3?   Navigator.push(
                                context, MaterialPageRoute(builder: (context) => MyProductsScreen()))
                                :        i==4?   Navigator.push(
                                context, MaterialPageRoute(builder: (context) => OffersScreen()))
                                :        i==5?   Navigator.push(
                                context, MaterialPageRoute(builder: (context) => MyServicesScreen()))
                                : Navigator.push(
                                context, MaterialPageRoute(builder: (context) => CommunicateScreen()));

                          });
                        },
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height:50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(_dataitem[i]['imageUrl']),fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_dataitem[i]['title'],style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                    Text(_dataitem[i]['Subtitle'],style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                                  ],),
                              ),

                              Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(getColorHexFromStr("#727C8E")).withOpacity(.3),
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.black,textDirection: TextDirection.ltr,size: 10,))),
                            ]
                        ),
                      ),
                    );
                  }),

      ),
    );
  }
  List<Map<String, dynamic>> _dataitem = [
    {
      'title': 'اللوجو',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/5361/5361057.png",
    },
    {
      'title': 'صور المتجر',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/1040/1040241.png",
    },
    {
      'title': 'نوع المتجر و وصفه',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/5208/5208469.png",
    },
    {
      'title': 'منتجاتى',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/1524/1524855.png",
    },
    {
      'title': 'العروض',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/726/726476.png",
    },
    {
      'title': 'خدماتى',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/3649/3649453.png",
    },
    {
      'title': 'معلومات التواصل',
      'Subtitle': 'هناك حقيقة مثبتة منذ زمن طويل',
      'imageUrl': "https://image.flaticon.com/icons/png/512/2343/2343697.png",
    },
  ];
}
