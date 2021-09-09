import 'package:flutter/material.dart';
import 'package:untitled9/features/Paying/PaymentMethod/presentation/widgets/bottomSheetAddCard.dart';
import 'package:untitled9/Color.dart';
class PaymentMethod extends StatefulWidget {

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _selectedPaymentConfirmation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("بطاقتك الائتمانية",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
            ),

            Expanded(child:  ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataPaymentConfirmation.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (ctx, index) {
                  return PaymentConfirmationItem(
                      title:  dataPaymentConfirmation[index]['title'],
                      selected: dataPaymentConfirmation[index]['isSelected'],
                      index: index,
                      function: (){
                        setState(() {
                          dataPaymentConfirmation[_selectedPaymentConfirmation]['isSelected'] = false;
                          _selectedPaymentConfirmation = index;
                          dataPaymentConfirmation[_selectedPaymentConfirmation]['isSelected'] = true;

                        });
                      }

                  );
                }),
            ),
          ],),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
            onPressed: () {
              bottomSheetbottomSheetAddCard(context: context);
            },
            child:Icon(Icons.add,color: Colors.white,),
            backgroundColor: Color(getColorHexFromStr("#009DDD"))
        ),
      ),
    );
  }


  PaymentConfirmationItem({String title, int index, bool selected,Function function}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent
      ,highlightColor: Colors.transparent,
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 216,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected?Color(getColorHexFromStr("#222222")):Colors.grey
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Image.asset("assets/image/card.png",width: 45,height: 30,fit: BoxFit.cover,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("3458 **** **** ****",style: TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),),
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
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent
              ,highlightColor: Colors.transparent,
              onTap: function,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: selected,
                        activeColor: selected?Colors.black:Colors.grey,
                        onChanged: (bool val){
                          setState(() {
                            dataPaymentConfirmation[_selectedPaymentConfirmation]['isSelected'] = false;
                            _selectedPaymentConfirmation = index;
                            dataPaymentConfirmation[_selectedPaymentConfirmation]['isSelected'] = true;
                          });
                        },
                      ),
                      Text("استخدام هذه البطاقة الائتمانية",style: TextStyle(color: selected?Colors.black:Colors.grey,fontWeight: FontWeight.bold),),
                    ],)
              ),
            )
          ],
        ),
      ),
    );
  }
  List<Map<String, dynamic>> dataPaymentConfirmation = [
    {'isSelected': true,},
    {'isSelected': false,},
  ];
}
