import 'package:flutter/material.dart';
import 'package:untitled9/features/Paying/AddNewAddress/presentation/widgets/AddAddressTextForm.dart';
import 'package:untitled9/Color.dart';
class AddNewAddressScreen extends StatefulWidget {
  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}
class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController country=TextEditingController();
  TextEditingController area=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController code=TextEditingController();

  String _address,_country,_area,_city,_name,_code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(getColorHexFromStr("#F9F9F9")),

      body: ListView(children: [
        AddAddressTextFild(
          hint: "الاسم بالكامل",
          textEditingController:name ,
          textInputType: TextInputType.text,
          onclick: (value) {  _name = value;
          },
        ),
        AddAddressTextFild(
          hint: "العنوان",
          textEditingController:address ,
          textInputType: TextInputType.text,
          onclick: (value) {  _address = value;
          },
        ),
        AddAddressTextFild(
          hint: "الدولة",
          textEditingController:country ,
          textInputType: TextInputType.text,
          onclick: (value) {  _country = value;
          },
        ),
        AddAddressTextFild(
          hint: "الحى / القطاع / المركز",
          textEditingController:area ,
          textInputType: TextInputType.text,
          onclick: (value) {  _area = value;
          },
        ),
        AddAddressTextFild(
          hint: "Zip Code",
          textEditingController:code ,
          textInputType: TextInputType.number,
          onclick: (value) {  _code = value;
          },
        ),
        AddAddressTextFild(
          hint: "المدينة",
          textEditingController:city ,
          textInputType: TextInputType.text,
          onclick: (value) {  _city = value;
          }
        ),

        Padding(
          padding: const EdgeInsets.all(15),
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
              child: Center(child: Text("متابعة الدفع",style: TextStyle(color: Colors.white,fontSize: 20),),),
            ),
          ),
        ),
      ],),
    );
  }
}
