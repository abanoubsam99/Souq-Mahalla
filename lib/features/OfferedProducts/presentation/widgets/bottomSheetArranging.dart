import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';

bottomSheetArranging({@required BuildContext context,String arrangetitle}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
      context: context,
      elevation: 0,
      builder: (context) {
        return Arranging();
      });
}
class Arranging extends StatefulWidget {
  @override
  _ArrangingState createState() => _ArrangingState();
}

class _ArrangingState extends State<Arranging> {
  int _selectedCard = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
          color: Color(getColorHexFromStr("#F9F9F9")),
          borderRadius: BorderRadius.only(topRight:Radius.circular(25) ,topLeft: Radius.circular(25))
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ترتيب حسب",style: TextStyle(color: Colors.black,fontSize: 18),),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _datatop.length,
                  itemBuilder: (ctx, index) {
                    return listItems(
                        catName: _datatop[index]['title'],
                        selected: _datatop[index]['isSelected'],
                        index: index,
                        function: (){
                          setState(() {
                            _datatop[_selectedCard]['isSelected'] = false;
                            _selectedCard = index;
                            _datatop[_selectedCard]['isSelected'] = true;
                          });
                        }
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }


  List<Map<String, dynamic>> _datatop = [
    {'title': 'الأكثر طلبا', 'isSelected': false,},
    {'title': 'الاحدث','isSelected': false,},
    {'title': 'حسب التقييم','isSelected': false,},
    {'title': 'السعر : من الأقل الى الاكثر','isSelected': true,},
    {'title': 'السعر : من الأكثر الى الاقل','isSelected': false,},

  ];
  listItems({String catName, int index, bool selected,Function function}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent
      ,highlightColor: Colors.transparent,
      onTap: function,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: selected ? Color(getColorHexFromStr("#009DDD")) : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                catName,
                style: TextStyle(color: selected ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
