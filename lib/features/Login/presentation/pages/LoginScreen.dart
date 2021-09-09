import 'package:flutter/material.dart';
import 'package:untitled9/features/ChangPassword/presentation/pages/ChangPasswordScreen.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/HomePage/HomePage/presentation/pages/HomePage.dart';
import 'package:untitled9/features/Login/presentation/widgets/LoginTextFild.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   String _name,_password;
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   String radioButtonItem = 'ONE';

   // Group Value for Radio Button.
   int id = 2;
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
          child: Form(
            key:_formKey ,
            child: SingleChildScrollView(
              child:
              Column(children: [
                SizedBox(height: 100,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    child: Center(child: Image.asset("assets/image/icon.png"))),
                Text("تسجيل الدخول" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                Text("في سوق ودليل المحلة " ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),

                LoginTextFild(
                  hint: "اسم المستخدم",
                  secure: false,
                  onclick: (value) {  _name = value;},
                  textInputType:  TextInputType.text,
                  icon: Icons.person_outline,
                  textEditingController: name,
                ),
                LoginTextFild(
                  hint: "كلمة المرور",
                  secure: true,
                  onclick: (value) {  _password = value;},
                  textInputType:  TextInputType.visiblePassword,
                  icon: Icons.lock,
                  textEditingController: password,
                ),
                SizedBox(height: 10,),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("نوع التسجيل" ,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                      Material(
                        color: Colors.transparent,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Radio(
                              value: 2,
                              groupValue: id,
                              activeColor: Colors.grey,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'TWO';
                                  id = 2;
                                });
                              },
                            ),
                            Text(
                              'كمشترى',
                              style: new TextStyle(fontSize: 14.0,color: Colors.grey),

                            ),
                            Radio(
                              value: 1,
                              groupValue: id,
                              activeColor: Colors.grey,
                              onChanged: (val) {
                                setState(() {
                                  radioButtonItem = 'ONE';
                                  id = 1;
                                });
                              },
                            ),
                            Text(
                              'كتاجر',
                              style: new TextStyle(fontSize: 15.0,color: Colors.grey),
                            ),
                          ],),
                      ),

                    ],),
                ),
                SizedBox(height: 10,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          id==1?
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => HomePage(isAdmin: true,)))
                          :  Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage(isAdmin: false,)));
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
                            "تسجيل الدخول",
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

                SizedBox(height: 20,),


                Text(" او سجل عن طريق" ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                SizedBox(height: 10,),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset("assets/image/googlelogin.png",width: 60,height: 60),
                  Image.asset("assets/image/facelogin.png",width: 60,height: 60),
                  Image.asset("assets/image/twitterlogin.png",width: 60,height: 60),
                ],),

                SizedBox(height: 20,),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ChangPasswordScreen())); },
                        child: Text("اضغط هنا" ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,decoration: TextDecoration.none),)),
                    Text("هل نسيت كلمة السر ؟ " ,style: TextStyle(color: Colors.grey.withOpacity(.7),fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),

                  ],),

                SizedBox(height: 300,),

              ],),
            ),
          ),
        ),
      ],
    );
  }
}
