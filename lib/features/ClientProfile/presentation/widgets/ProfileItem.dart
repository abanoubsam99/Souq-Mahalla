import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
class ProfileItem extends StatelessWidget {
  IconData iconData;
  String title;
   Function function;
   ProfileItem({@required this.function,@required this.iconData,@required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: InkWell(
          onTap: function,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(iconData,textDirection: TextDirection.ltr,color: Color(getColorHexFromStr("#727C8E")),),
              SizedBox(width: 25,),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(color: Color(getColorHexFromStr("#727C8E")) ),),
                  ],
                ),
              ),
              Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(getColorHexFromStr("#727C8E")).withOpacity(.3),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.black,textDirection: TextDirection.ltr,size: 10,))),
            ],),
        ),
      ),
    );
  }
}
