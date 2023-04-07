import 'package:contact_app/contact_screen/modal_class.dart';
import 'package:contact_app/contact_screen/phono.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController txtname =TextEditingController();
  TextEditingController txtcontact =TextEditingController();
  TextEditingController txtna =TextEditingController();
  TextEditingController txtcon =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          // Center(
          //   child: CircleAvatar(
          //     radius: 50,
          //    backgroundImage: AssetImage("assets/image/shirt.png"),
          //     child: Image.asset("assets/image/shirt.png"),
          //   ),
          // ),
          SizedBox(height: 20),
          TextField(
            controller: txtname,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo,width: 2,)
              ),
              labelText: 'Name',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtcontact,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo,width: 2,)
              ),
              labelText: 'Contact no',
            ),
          ),
          SizedBox(height: 20),

          ElevatedButton(onPressed: () {
            String name =txtname.text;
            String contactno =txtcontact.text;


            DataModal d1 =DataModal(name: name,phone: contactno);
            contactList.add(d1);
            Navigator.pop(context);
          }, child: Text(
            "Add contact"
          )),
          SizedBox(height: 20),

          ElevatedButton(onPressed: () {

          }, child: Text("Update")),
          TextField(
            controller: txtna,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo,width: 2,)
              ),
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: txtcon,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo,width: 2,)
              ),
              labelText: 'Name',
            ),
          ),
        ],
      ),
    ));
  }
}
