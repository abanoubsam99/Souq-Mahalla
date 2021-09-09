import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';
import 'package:untitled9/features/Chat/presentation/pages/ChatRoom.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          color: Colors.grey.withOpacity(.4),
          child: Row(children: [
            SizedBox(width: 20,),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19720.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "محمود عبده",
                  style: TextStyle(
                      color: Color(getColorHexFromStr("#515C6F")),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mahmoud-abdo@email.com",
                  style: TextStyle(
                      color: Color(getColorHexFromStr("#515C6F")),
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],),

        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ChatScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2-40,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(getColorHexFromStr("#009DDD")),
                    borderRadius: BorderRadius.circular(50)
                ),
                child:  Center(child: Text("قبول",style: TextStyle(color: Colors.white),)),

              ),
            ),

              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ChatScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/2-40,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(getColorHexFromStr("#15233D")),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child:  Center(child: Text("رفض",style: TextStyle(color: Colors.white),)),

                ),
              ),
          ],),
        ),



        Expanded(child: ChatRoom())

      ],),
    );
  }
}

