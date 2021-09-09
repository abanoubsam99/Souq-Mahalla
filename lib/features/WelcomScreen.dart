import 'package:flutter/material.dart';
import 'package:untitled9/features/ChangPassword/presentation/pages/ChangPasswordScreen.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/Login/presentation/pages/LoginScreen.dart';
import 'package:untitled9/features/SignUp/presentation/pages/SignUpScreen.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              Text("مرحبا بكم" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
              Text("في سوق المحلة للتسويق" ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),

            ],),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                width: MediaQuery.of(context).size.width-50,
                height: 55,
                decoration: BoxDecoration(
                  color:  Color(getColorHexFromStr('#3B5998')),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/image/face.png"),
                  Text("Facebook" ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                  SizedBox(width: 10,)
                ],
              ),
              ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width-50,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/image/google.png"),
                    Text("Google" ,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                    SizedBox(width: 10,)
                  ],
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 55,
                  child: OutlineButton(
                    child: new Text("تسجيل الدخول",style:TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginScreen()));                    },
                  ),
                ),
              ),
SizedBox(height: 15,),
              Center(child: Text("لا تمتلك حساب ؟" ,style: TextStyle(color: Colors.grey.withOpacity(.7),fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),)),
              FlatButton(onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUpScreen())); },
                  child: Center(child: Text("انشاء حساب" ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,decoration: TextDecoration.none),))),
              SizedBox(height: 25,),


            ],),
        ),




      ],
    );
  }
}
