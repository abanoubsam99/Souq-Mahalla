import 'package:flutter/material.dart';
import 'package:untitled9/features/ChangPassword/presentation/pages/ChangPasswordScreen.dart';
import 'package:untitled9/features/VerifiedCode/presentation/pages/ChangePassSuccessSceen.dart';
import 'package:untitled9/features/VerifiedCode/presentation/widgets/verifiedCodeTextFild.dart';
import 'package:untitled9/Color.dart';
class verifiedCodeScreen extends StatefulWidget {

  @override
  _verifiedCodeScreenState createState() => _verifiedCodeScreenState();
}

class _verifiedCodeScreenState extends State<verifiedCodeScreen> {
   String _n1,_n2,_n3,_n4;
  TextEditingController n1=TextEditingController();
  TextEditingController n2=TextEditingController();
  TextEditingController n3=TextEditingController();
  TextEditingController n4=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/image/welcome.png"),fit: BoxFit.fill)
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  child: Center(child: Image.asset("assets/image/icon.png"))),
              Column(children: [
                Text("إعادة تعيين كلمة السر" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
              ],),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 36),
                    children: <TextSpan>[
                      TextSpan(text:"من فضلك ادخل " ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                      TextSpan(text:" الكود " ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                      TextSpan(text:"الذى تم ارساله والذى" ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                    ],
                  ),
                ),
              ),
              Center(child: Text("يتكون من اربع ارقام وحروف " ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),)),
              SizedBox(height: 20,),

              Form(
                key: _formKey,

                child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    width: 80,
                    child: verifiedCodeTextFild(
                      hint: "ــــــــــ",
                      secure: false,
                      onclick: (value) {  _n1 = value;},
                      textInputType:  TextInputType.number,
                      textEditingController: n1,
                    ),
                  ),
                  Container(
                    width: 80,
                    child: verifiedCodeTextFild(
                      hint: "ــــــــــ",
                      secure: false,
                      onclick: (value) {  _n2 = value;},
                      textInputType:  TextInputType.number,
                      textEditingController: n2,
                    ),
                  ),
                  Container(
                    width: 80,
                    child: verifiedCodeTextFild(
                      hint: "ــــــــــ",
                      secure: false,
                      onclick: (value) {  _n3 = value;},
                      textInputType:  TextInputType.number,
                      textEditingController: n3,
                    ),
                  ),
                  Container(
                    width: 80,
                    child: verifiedCodeTextFild(
                      hint: "ــــــــــ",
                      secure: false,
                      onclick: (value) {  _n4 = value;},
                      textInputType:  TextInputType.number,
                      textEditingController: n4,
                    ),
                  ),
                ],),
              ),

              SizedBox(height: 20,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ChangePassSuccessSceen()));
                      } else {
                        print("Login validator error");
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(getColorHexFromStr("#009DDD"))),
                      child: Center(
                        child: Text(
                          "تأكيد الادخال",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,decoration: TextDecoration.none ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangPasswordScreen()));
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 36),
                        children: <TextSpan>[
                          TextSpan(text:"لم يتم الارسال بعد ؟ " ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                          TextSpan(text:" اضغط هنا " ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120,)

            ],),
        ),
      ],
    );
  }
}
