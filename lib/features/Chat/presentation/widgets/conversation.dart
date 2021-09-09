import 'package:flutter/material.dart';
import 'package:untitled9/Color.dart';

class Conversation extends StatelessWidget {
  // const Conversation({
  //   Key key,
  //   @required this.user,
  // }) : super(key: key);

//  final User user;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.builder(
          reverse: true,
          itemCount: 3,
          itemBuilder: (context, int index) {
            // final message = messages[index];
            // bool isMe = message.sender.id == currentUser.id;
            return Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    index%2==0 ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if ( index%2!=0)
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage("https://image.freepik.com/free-photo/three-young-beautiful-smiling-girls-trendy-summer-casual-jeans-clothes-sexy-carefree-women-posing-positive-models-sunglasses_158538-4730.jpg"),
                        ),

                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6),
                        decoration: BoxDecoration(
                            color: index%2!=0 ? Color(getColorHexFromStr("#15233D")) : Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(index%2==0 ? 12 : 0),
                              bottomRight: Radius.circular(index%2==0 ? 0 : 12),
                            )),
                        child: Text(
                          index%2!=0? "السلام عليكم ورحمة الله وبركاته انا احمد وانا عاوز اشترى القميص الاسود المتسورد وكنت بستفسر عن الخامة المصنعة حتى لا تتلف فيما بعد واريد انا اسئل ايضا عن السعر لو اشتريت كمية كبيرة جدا فهل يتم عمل خصم على الكميات ام لا "
                          :"اهلا بحضرتك يا فندم",
                          style: TextStyle(
                              color: index%2!=0 ? Colors.white : Colors.grey[800]),
                        ),
                      ),


                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 5),
                  //   child: Row(
                  //     mainAxisAlignment:
                  //     index%2==0 ? MainAxisAlignment.end : MainAxisAlignment.start,
                  //     children: [
                  //       if (index%2==0)
                  //         SizedBox(
                  //           width: 40,
                  //         ),
                  //       Icon(
                  //         Icons.done_all,
                  //         size: 20,
                  //         color:Colors.grey,
                  //       ),
                  //       SizedBox(
                  //         width: 8,
                  //       ),
                  //       Text(
                  //        " message.time",
                  //         style: TextStyle(color: Colors.grey),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            );
          }),
    );
  }
}