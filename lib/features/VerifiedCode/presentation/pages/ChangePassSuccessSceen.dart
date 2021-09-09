import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/Login/presentation/pages/LoginScreen.dart';
class ChangePassSuccessSceen extends StatefulWidget {

  @override
  _ChangePassSuccessSceenState createState() => _ChangePassSuccessSceenState();
}

class _ChangePassSuccessSceenState extends State<ChangePassSuccessSceen> {
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
                Text("تهانينا" ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
                Text("فى سوق المحلة للتسويق" ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),

              ],),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2000)
                    ),
                    child: Icon(Icons.check,color: Colors.green,size: 50,),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              Center(child: Text("تم تعيين كلمة السر الجديدة بنجاح" ,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal,decoration: TextDecoration.none),)),


              SizedBox(height: 20,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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


            ],),
        ),
      ],
    );
  }
}
