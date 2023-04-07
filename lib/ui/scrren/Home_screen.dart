import 'package:contact_app/contact_screen/modal_class.dart';
import 'package:flutter/material.dart';


List<DataModal> contactList=[
  DataModal(name: "Ratan TATA",phone:"7845125623" ),
  DataModal(name: "Mukesh Ambani",phone: "8856325487"),
  DataModal(name: "Gutam Adani",phone: "7045892354"),
  DataModal(name: "Kumar Birla",phone: "9978452165"),
  DataModal(name: "Narayana Murthy",phone: "9754216598"),
  DataModal(name: "Dixit Patoliya",phone: "7045216598"),
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: Center(child: Text("Contact")),
            ),
            Divider(height: 10,thickness: 2,color: Colors.red,),
            Center(
              child: ListView.builder(itemBuilder: (context, index) {
                return mywidget(contactList[index].name,contactList[index].phone,index);
              },
                itemCount: contactList.length,),
            ),
          ],
        ),
        floatingActionButton:FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addcon').then((value) {
              setState(() {

              });
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
  Widget mywidget(String? data,String? pho,int index)
  {
    return ExpansionTile(
      title: Text("$data",style: TextStyle(color: Colors.black),),
      leading: Icon(Icons.phone),
      subtitle: Text("$pho",style: TextStyle(color: Colors.blueGrey),),

    );
  }
}
