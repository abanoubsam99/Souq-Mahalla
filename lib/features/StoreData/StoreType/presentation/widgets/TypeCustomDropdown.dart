import 'package:flutter/material.dart';
class TypeCustomDropdown extends StatefulWidget {
  @override
  _TypeCustomDropdownState createState() => _TypeCustomDropdownState();
}

class _TypeCustomDropdownState extends State<TypeCustomDropdown> {
  String  Statusval;
  String _Statusvalue ;
  var _items =  [ " محل ملابس رجالي"," محل ملابس حريمي " ,"اكسسوارات","موبايلات","احذية"];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            color: Colors.white ),
        child: Padding(
          padding: const EdgeInsets.only(right: 3),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _Statusvalue,
              style: TextStyle(fontSize:15, color: Colors.black, fontWeight: FontWeight.bold),
              hint: Text("  نوع المتجر"),
              icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
              items:_items.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(items),
                      ],
                    )
                );
              }
              ).toList(),
              onChanged: (String newValue){
                setState(() {
                  Statusval = newValue;
                  _Statusvalue=Statusval;
                });
              },
            ),
          ),
        ),
      );
  }
}
