import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/HomePage/Sections/presentation/pages/SectionsDetailsScreen.dart';
class SectionsScreen extends StatefulWidget {
  @override
  _SectionsScreenState createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height ,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SectionsDetailsScreen(title: _dataitem[i]['title'])));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-30,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(image: NetworkImage(_dataitem[i]['imageUrl']),fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width-30,
                            height:80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              //color:_dataitem[i]['color'] ,
                              gradient: LinearGradient(
                                  colors: [
                                    _dataitem[i]['color'],
                                    _dataitem[i]['color2'],
                                  ])
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width-30,
                            height:80,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 7,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                                Text(_dataitem[i]['title'],style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),
                                SizedBox(width: 1,),

                              ],
                            ),
                          ),

                        ]
                    ),
                  ),
                ),
              );
            }),
      ),

    );
  }
  List<Map<String, dynamic>> _dataitem = [
    {
      'title': 'الكترونيات',
      'imageUrl': "https://image.freepik.com/free-vector/circuit-board-background_52683-6671.jpg",
      'color':Color(getColorHexFromStr("#64B6FF")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#667EEA")).withOpacity(.75),


    },
    {
      'title': 'ملابس رجالى',
      'imageUrl': "https://image.freepik.com/free-photo/interior-shot-racks-with-shirts-undershirts-jeans_88135-5869.jpg",
      'color':Color(getColorHexFromStr("#FF4665")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#832BF6")).withOpacity(.75),

    },
    {
      'title': 'ملابس حريمى',
      'imageUrl': "https://image.freepik.com/free-photo/shop-clothing-clothes-shop-hanger-modern-shop-boutique_1150-8886.jpg",
      'color':Color(getColorHexFromStr("#3B40FE")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#2DCEF8")).withOpacity(.75),

    },
    {
      'title': 'موبيلات ',
      'imageUrl': "https://image.freepik.com/free-psd/smartphone-clay-mockup_165789-425.jpg",
      'color':Color(getColorHexFromStr("#21E590")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#009DC5")).withOpacity(.75),

    },
    {
      'title': 'اكسسوارات',
      'imageUrl': "https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg",
      'color':Color(getColorHexFromStr("#D236D2")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#FF870E")).withOpacity(.75),

    },
    {
      'title': 'احذية',
      'imageUrl': "https://image.freepik.com/free-photo/shoemaker-workshop-making-shoes_171337-12277.jpg",
      'color':Color(getColorHexFromStr("#5C51FF")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#FE327E")).withOpacity(.75),

    },
    {
      'title': 'ملابس',
      'imageUrl': "https://image.freepik.com/free-photo/blonde-girl-with-flowers-near-face_91497-1995.jpg",
      'color':Color(getColorHexFromStr("#6143FF")).withOpacity(.75),
      'color2':Color(getColorHexFromStr("#2CE3F1")).withOpacity(.75),

    },
  ];
}
