import 'package:flutter/material.dart';
import 'package:untitled9/features/BankAccount/presentation/widgets/BankTextFormField.dart';
import 'package:untitled9/Color.dart';
class BankAccountScreen extends StatefulWidget {

  @override
  _BankAccountScreenState createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController cvv=TextEditingController();

  String _name,_date,_number,_cvv;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "حساب البنك",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child:  Container(
                    height: 216,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(getColorHexFromStr("#222222"))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Image.asset("assets/image/card.png",width: 45,height: 30,fit: BoxFit.cover,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("3458 **** **** ****",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: [
                                Text("Card Holder Name",style: TextStyle(color: Colors.white),),
                                Text("Abanoub Samy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),

                              ],),
                              Column(children: [
                                Text("Expire Date",style: TextStyle(color: Colors.white),),
                                Text("25/11",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),

                              ],),

                              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/990px-Mastercard-logo.svg.png",width: 40,height: 40,),

                            ],),
                          SizedBox(height: 5,),
                        ],),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BankTextFormField(
                      hint: "Name on card",
                      textEditingController:name ,
                      textInputType: TextInputType.text,
                      onclick: (value) {  _name = value;
                      },
                    ),

                    Row(children: [
                      Expanded(child:
                      BankTextFormField(
                        hint: "Name on card",
                        textEditingController:number ,
                        textInputType: TextInputType.number,
                        onclick: (value) {  _name = value;
                        },
                      ),),
                      SizedBox(width: 10,),
                      Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/990px-Mastercard-logo.svg.png",width: 40,height: 40,)
                    ],),
                    SizedBox(height: 10,),

                    BankTextFormField(
                      hint: "Expire Date ",
                      textEditingController:date ,
                      textInputType: TextInputType.datetime,
                      onclick: (value) {  _date = value;
                      },
                    ),
                    SizedBox(height: 10,),

                    BankTextFormField(
                      hint: "CVV",
                      textEditingController:cvv ,
                      textInputType: TextInputType.datetime,
                      onclick: (value) {  _cvv = value;
                      },
                    ),
                  ],
                ),
              ),

            ],),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => PayingScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(getColorHexFromStr("#009DDD"))
                ),
                child: Center(child: Text("حفظ التعديل",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
