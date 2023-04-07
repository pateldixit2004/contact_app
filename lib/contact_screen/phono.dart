import 'package:contact_app/contact_screen/modal_class.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


List<DataModal> contactList = [
  DataModal(name: "Ratan TATA", phone: "7845125623"),
  DataModal(name: "Mukesh Ambani", phone: "8856325487"),
  DataModal(name: "Gutam Adani", phone: "7045892354"),
  DataModal(name: "Kumar Birla", phone: "9978452165"),
  DataModal(name: "Narayana Murthy", phone: "9754216598"),
  DataModal(name: "Dixit Patoliya", phone: "7045216598"),
];

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController txtname =TextEditingController();
  TextEditingController no =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Scrollbar(
          child: ListView.builder(itemBuilder: (context, index) {
            return mywidget(
                contactList[index].name, contactList[index].phone, index);
          },
            itemCount: contactList.length,),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addcon').then((value) {
            setState(() {

            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget mywidget(String? data, String? pho, int index) {
    return ExpansionTile(
      title: Text("$data", style: TextStyle(color: Colors.black),),
      leading: Icon(Icons.phone),
      subtitle: Text("$pho", style: TextStyle(color: Colors.blueGrey),),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            IconButton(onPressed: () {
              setState(() {
                contactList.removeAt(index);
              });
            }, icon: Icon(Icons.delete, color: Colors.red,)),
            IconButton(onPressed: () {


              update(index);
            }, icon: Icon(Icons.next_week, color: Colors.red,)),
            IconButton(onPressed: () {
              setState(() {
                Navigator.pushNamed(
                    context, 'con', arguments: contactList[index]);
              });
            }, icon: Icon(Icons.next_plan, color: Colors.blue,)),
            IconButton(onPressed: () async {


              String link = "tel: ${contactList[index].phone}";
              await launchUrl(Uri.parse(link));


            }, icon: Icon(Icons.call, color: Colors.green,)),
            IconButton(onPressed: () {
              Share.share(
                  "${contactList[index].name}\n ${contactList[index].phone}");
            }, icon: Icon(Icons.share, color: Colors.green,)),
            IconButton(onPressed: () async {
              // String link = "sms: ${contactList[index].phone}?body=Hello I Invalied to My App";
              Uri uri = Uri(scheme: "sms",
                  path: "${contactList[index].phone}",
                  queryParameters: {"body": "hello,Hyy"});
              //await launchUrl(Uri.parse(link));
              await launchUrl(uri);
            }, icon: Icon(Icons.message, color: Colors.amber,)),
          ],
        )
      ],
    );
  }

  void update(int index) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [



          TextField(controller:txtname,),
          TextField(controller: no ,),
          ElevatedButton(onPressed: () {

            String newname= txtname.text;
            String newno= no.text;

            setState(() {
              contactList[index]= DataModal(name: newname,phone: newno);

            });

            Navigator.pop(context);
          }, child: Text("update"))
        ],
      ),);
    },);
  }
}
