import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/features/HomePage/Cart/presentation/widgets/DeleteMessage.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/Paying/Paying/presentation/pages/PayingScreen.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _val=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  25,vertical: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/5+10,
                          height: 100,
                          decoration:BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage("https://img.freepik.com/free-photo/dark-haired-woman-with-red-lipstick-smiles-leans-stand-with-clothes-holds-package-pink-background_197531-17609.jpg?size=338&ext=jpg"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),



                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("تيشرت رجالى مستورد",style: TextStyle(color: Colors.black,fontSize: 12),),
                          Row(children: [
                            Row(
                              children: [
                                Text("اللون : ",style: TextStyle(color: Colors.grey,fontSize: 8),),
                                Text("اسود",style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Row(
                              children: [
                                Text("المقاس : ",style: TextStyle(color: Colors.grey,fontSize: 8),),
                                Text("L",style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.bold),),
                              ],
                            ),

                          ],),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    if(_val>0){
                                      setState(() {
                                        _val--;
                                      });
                                    }

                                  },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text("-",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold)),),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text(_val.toString()),
                                SizedBox(width: 10,),

                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      _val++;
                                    });
                                  },
                                  child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text("+",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold)),),
                              ),
                                ),

                            ],),
                        ],),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 3),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: (){
                                DeleteMessage(context);
                              }, icon:Icon( Icons.delete_outline_rounded,color: Colors.red,)),
                              Text("51\$",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),

                      ],),


                  ),
                );
              }),
        ),
          SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15),bottomLeft: Radius.circular(50) ,topLeft:  Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [

                  Expanded(
                      child:TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'ادخل كود الخصم',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // labelText: 'Name *',
                        ),

                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "validator error Message";
                          }
                        },
                      )),
                  SizedBox(width: 10,),

                  Container(
                    width: 45,
                     height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back,color: Colors.white,textDirection: TextDirection.ltr,),),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("الحساب الاجمالى",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),

              Text("128 \$",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
          ],),
          SizedBox(height: 2,),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PayingScreen()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width-30,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(getColorHexFromStr("#009DDD"))
              ),
              child: Center(child: Text("متابعة الدفع",style: TextStyle(color: Colors.white,fontSize: 20),),),
            ),
          ),
          SizedBox(height: 10,)


      ],),


    );
  }
}
