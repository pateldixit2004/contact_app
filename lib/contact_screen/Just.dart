import 'package:contact_app/contact_screen/modal_class.dart';
import 'package:contact_app/contact_screen/phono.dart';
import 'package:flutter/material.dart';

class Just extends StatefulWidget {
  const Just({Key? key}) : super(key: key);

  @override
  State<Just> createState() => _JustState();
}

class _JustState extends State<Just> {
  TextEditingController txtna =TextEditingController();
  TextEditingController txtcon =TextEditingController();


  @override
  Widget build(BuildContext context) {
  DataModal d1 = ModalRoute.of(context)!.settings.arguments as DataModal;


    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("${d1.name},${d1.phone}"),

          ),
          TextField(
            controller: txtna,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo,width: 2,)
              ),
            //  labelText: '${d1.name}',
              hintText: '${d1.name}'

            ),
          ),
          TextField(
            controller: txtcon,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo,width: 2,)
              ),
              //labelText: 'conatcat',
              hintText: '${d1.phone}'
            ),
          ),
          ElevatedButton(onPressed: () {


           // contactList.clear();



            String na= txtna.text;
            String con= txtcon.text;




            setState(() {

              int index;
              //contactList[index]=DataModal(name: na,phone: con);
              Navigator.pop(context);

            });



            // print("${d1.name}");
            // print("${d1.phone}");


          }, child: Text("Update\\")),
        ],
      ),
    );
  }


  Widget update(int index)
  {
    return Column(
      children: [
        ElevatedButton(onPressed: () {

          String na= txtna.text;
          String con= txtcon.text;
          setState(() {

            contactList[index]=DataModal(name: na,phone: con);

          });


        }, child: Text(""))
      ]
    );
  }
}
