import 'package:contact_app/contact_screen/Add_contact_screen.dart';
import 'package:contact_app/contact_screen/Just.dart';
import 'package:contact_app/contact_screen/phono.dart';
import 'package:contact_app/ui/scrren/Home_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       '/':(context) => Home_Screen(),
        'addcon':(context) => AddContact(),
        'con':(context) => Just(),
       //  '/':(context) => Home(),
      },
     theme: ThemeData.light(),
    )
  );
}