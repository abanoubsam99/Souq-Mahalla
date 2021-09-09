import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled9/Color.dart';
void showEvaluationDialog({BuildContext context}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return _evaluation(context: context);
    },
    transitionBuilder: (_, anim, __, child) {
      return Align(
        alignment: Alignment.center,
        child: SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        ),
      );
    },
  );
}


Widget _evaluation({@required BuildContext context}) {
  return Container(
    height:250,
    width: MediaQuery.of(context).size.width-20,
    decoration: BoxDecoration(
        color: Color(getColorHexFromStr("#F9F9F9")),
        borderRadius: BorderRadius.circular(10)
    ),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("ما هو تقييمك ؟",style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none),),
          RatingBar.builder(
            initialRating: 3,
            minRating: 0.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text("-------------------------------",style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none),),
          Expanded(child: EvaluationTextFild(
          )),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(getColorHexFromStr("#009DDD"))
                ),
                child: Center(child: Text("ارسال التقييم",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class EvaluationTextFild extends StatelessWidget {
  String hint="اكتب رايك";
  TextEditingController _controller=TextEditingController();
  String _errorMessage(String error) {
    switch (hint) {
      case "اكتب رايك":
        return "يجب كنابة رايك";
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
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 7,
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