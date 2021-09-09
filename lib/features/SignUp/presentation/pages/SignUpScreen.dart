import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/Login/presentation/pages/LoginScreen.dart';
import 'package:untitled9/features/SignUp/presentation/pages/UsagePolicyScreen.dart';
import 'package:untitled9/features/SignUp/presentation/widgets/SignUpTextFild.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   String _email,_name,_password,_phone;
  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
   TextEditingController phone=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Default Radio Button Selected Item When App Starts.
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
                  Text("انشاء حساب" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                  Text("في سوق المحلة للتسويق" ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
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
                  SignupTextFild(
                      hint: "اسم المستخدم",
                      secure: false,
                      onclick: (value) {  _name = value;},
                      textInputType:  TextInputType.text,
                    icon: Icons.person_outline,
                    textEditingController: name,
                  ),
                  SignupTextFild(
                    hint: "البريد الالكترونى",
                    secure: false,
                    onclick: (value) {  _email = value;},
                    textInputType:  TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    textEditingController: email,
                  ),
                  SignupTextFild(
                    hint: "رقم الموبايل",
                    secure: false,
                    onclick: (value) {  _phone = value;},
                    textInputType:  TextInputType.phone,
                    icon: Icons.phone_android,
                    textEditingController: phone,
                  ),
                  SignupTextFild(
                    hint: "كلمة المرور",
                    secure: true,
                    onclick: (value) {  _password = value;},
                    textInputType:  TextInputType.visiblePassword,
                    icon: Icons.lock,
                    textEditingController: password,
                  ),
                  SizedBox(height: 50,),
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
                              style: new TextStyle(fontSize: 14.0,color: Colors.grey),
                            ),

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
                          ],),
                      ),

                    ],),
                  ),
                  SizedBox(height: 30,),

                  Text(" بمجرد انشاء حساب  فأنت توافق" ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UsagePolicyScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(text:"على سياسية الاستخدام" ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                          ],
                        ),
                      ),
                    ),
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
                                context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          } else {
                            print("Sign Up validator error");
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
                              "انشاء حساب",
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

                  SizedBox(height: 250,),

                ],),
              ),
          ),
        ),




      ],
    );


  }
}
