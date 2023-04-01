import 'package:flutter/material.dart';
import 'package:untitled3/addNotes.dart';

import 'HOME.dart';
import 'Todo.dart';


void main() {
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Todo(),
      routes: {"addNotes":(Context)=>AddNotes() },
    );
  }
}
