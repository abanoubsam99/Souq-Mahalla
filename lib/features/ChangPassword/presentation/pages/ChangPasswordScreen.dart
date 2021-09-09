import 'package:flutter/material.dart';
import 'package:untitled9/features/ChangPassword/presentation/widgets/ChangepassTextFild.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/VerifiedCode/presentation/pages/verifiedCodeScreen.dart';
class ChangPasswordScreen extends StatefulWidget {

  @override
  _ChangPasswordScreenState createState() => _ChangPasswordScreenState();
}

class _ChangPasswordScreenState extends State<ChangPasswordScreen> {
   String _email;
  TextEditingController email=TextEditingController();
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
                      TextSpan(text:" البريد الالكترونى " ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                      TextSpan(text:" وستم ارسال رابط" ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                    ],
                  ),
                ),
              ),
              Center(child: Text("يتم من خلاله تعيين كلمة السر الخاصة بك " ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.none),)),
              SizedBox(height: 20,),

              Form(
                key: _formKey,
                child: ChangepassTextFild(
                  hint: "ادخل البريد الالكترونى",
                  secure: false,
                  onclick: (value) {  _email = value;},
                  textInputType:  TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  textEditingController: email,
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
    context, MaterialPageRoute(builder: (context) => verifiedCodeScreen()));
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
                          "ارسال",
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

              SizedBox(height: 120,)

            ],),
        ),
      ],
    );
  }
}
