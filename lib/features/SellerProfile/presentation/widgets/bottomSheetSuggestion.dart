import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';

bottomSheetSuggestion({@required BuildContext context,@required int Type}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
      context: context,
      elevation: 0,
      builder: (context) {
        return _suggestion(context: context);
      });
}
Widget _suggestion({@required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height/2,
    decoration: BoxDecoration(
      color: Color(getColorHexFromStr("#F9F9F9")),
      borderRadius: BorderRadius.only(topRight:Radius.circular(25) ,topLeft: Radius.circular(25))
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("عمل اقتراح او شكوى",style: TextStyle(color: Colors.black,fontSize: 16),),
          Expanded(child: suggestionTextFild(
           )),
          Container(
            width: MediaQuery.of(context).size.width-30,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(getColorHexFromStr("#009DDD"))
            ),
            child: Center(child: Text("ارسال",style: TextStyle(color: Colors.white,fontSize: 20),),),
          ),
          SizedBox(height: 10,)
        ],
      ),
    ),
  );
}

class suggestionTextFild extends StatelessWidget {
   String hint="عمل اقتراح او شكوى";
  TextEditingController _controller=TextEditingController();
  String _errorMessage(String error) {
    switch (hint) {
      case "عمل اقتراح او شكوى":
        return "يجب كنابة عمل اقتراح او شكوى";
    }
    return hint;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 154,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration:  InputDecoration(
                  hintText: 'عمل اقتراح او شكوى',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintMaxLines: 5,
                  // labelText: 'Name *',
                ),

                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "يجب كنابة عمل اقتراح او شكوى";
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*


Widget _movies ({required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height/3,

    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://lh3.googleusercontent.com/Dd9x0VFjxatRK_d5gPF_K7R6vOwgcDBjDtN64aNuPe-6yJjDxD2eRmZci0m2w4oYVSc=w200-h300'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Deadpool 2",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                    "Action & adventure",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Colors.grey,),
          Row(children: <Widget>[
            Icon(Icons.add_to_photos,color: Colors.grey,size: 20,),
            SizedBox(width:20,),
            Text( "Add to Wishlist", style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 35,
                child: OutlineButton(
                  child: Text('Rent from EGP 60.00',
                      style:
                      TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                  onPressed: () {}, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.grey, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 1, //width of the border
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("By from EGP 220.00",style: TextStyle(color: Colors.black,fontSize: 14),),),
              )

            ],)
        ],
      ),
    ),
  );
}


Widget _books ({required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height/3,

    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://books.google.com/books/content/images/frontcover/rBrADgAAQBAJ?fife=w200-h300'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Jerusalem",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                    "Action & adventure",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Colors.grey,),
          Row(children: <Widget>[
            Icon(Icons.add_to_photos,color: Colors.grey,size: 20,),
            SizedBox(width:20,),
            Text( "Add to Wishlist", style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 35,
                child: OutlineButton(
                  child: Text('Free sample',
                      style:
                      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  onPressed: () {}, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.grey, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 1, //width of the border
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("By  EGP 220.00",style: TextStyle(color: Colors.black,fontSize: 14),),),
              )

            ],)
        ],
      ),
    ),
  );
}
*/