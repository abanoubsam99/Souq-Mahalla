import 'package:flutter/material.dart';
import 'package:untitled9/features/Chat/presentation/pages/Chat.dart';
import 'package:untitled9/Color.dart';
import 'package:url_launcher/url_launcher.dart';
class TechnicalSupport extends StatefulWidget {

  @override
  _TechnicalSupportState createState() => _TechnicalSupportState();
}

class _TechnicalSupportState extends State<TechnicalSupport> {
  Future<void> _launched;
  String _phone = '01227120519';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "الدعم الفنى",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (_, __) => Center(child: Text("------------------------------------",style: TextStyle(color: Colors.grey),)),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            i==0?_launched = _makePhoneCall('tel:$_phone')
                                :i==1?_launchInWebViewWithJavaScript('https://deltawy.com/')
                                :i==2?_launchInBrowser('https://deltawy.com/')
                                :i==3?_launchInWebViewWithJavaScript('https://twitter.com/adrygraphy/status/1210671062918344704')
                                :_launchInWebViewWithJavaScript('https://www.facebook.com/deltawyNet/');

                          });
                        },
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                              Container(
                                width: 50,
                                height:50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(_dataitem[i]['imageUrl']),fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(width: 40,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_dataitem[i]['title'],style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                  Text(_dataitem[i]['Subtitle'],style: TextStyle(color: Color(getColorHexFromStr("#6E7FAA")),fontSize: 10,fontWeight: FontWeight.normal),),
                                ],),
                            ]
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 5,),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen()));
              },
              child: Container(
                width: 223,
                height: 55,
                decoration: BoxDecoration(
                  color: Color(getColorHexFromStr("#15233D")),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Image.asset("assets/image/chat.png",width: 26,height: 26,fit: BoxFit.cover,),
                  Text("التحدث المباشر",style: TextStyle(color: Colors.white),),
                ],),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
  List<Map<String, dynamic>> _dataitem = [
    {
      'title': 'تليفون محمول',
      'Subtitle': '01023262451',
      'imageUrl': "https://image.flaticon.com/icons/png/512/3014/3014736.png",
},
    {
      'title': 'البريد الالكترونى',
      'Subtitle': 'Mahmoud-abdo@info.com',
      'imageUrl': "https://image.flaticon.com/icons/png/512/893/893292.png",
    },
    {
      'title': 'الموقع الالكترونى',
      'Subtitle': 'deltawy.com',
      'imageUrl': "https://image.flaticon.com/icons/png/512/3988/3988014.png",
    },
    {
      'title': 'التويتر',
      'Subtitle': 'mahmoudabdo@tiwtter',
      'imageUrl': "https://image.flaticon.com/icons/png/512/3578/3578922.png",
    },
    {
      'title': 'السوشيال ميديا',
      'Subtitle': 'www.facebook.com/deltawyNet',
      'imageUrl': "https://image.flaticon.com/icons/png/512/2065/2065157.png",
    },
  ];
}
