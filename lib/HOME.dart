import 'package:flutter/material.dart';

import 'SQLDB.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb=SqlDb();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),

      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(color: Colors.red,
                textColor: Colors.white, onPressed: () async{
                int response=await sqlDb.insertData("INSERT INTO 'notes'('note')VALUES('note one')");
                print(response);
                },
                child: Text("Insert Data"),),
            ),
            Center(
              child: MaterialButton(color: Colors.red,
                textColor: Colors.white, onPressed: () async{
                  List<Map> response= await sqlDb.readData("select *from  notes");
 print("$response");
    },
                child: Text("Read Data"),
              ),
            ),
            Center(
              child: MaterialButton(color: Colors.red,
                textColor: Colors.white, onPressed: () async{
                  int response= await sqlDb.DeleteData("DELETE from notes WHERE 'id'=10 ");
                  print("$response");
                },
                child: Text("Delete Data"),
              ),
            ),
            Center(
              child: MaterialButton(color: Colors.red,
                textColor: Colors.white, onPressed: () async{
                  int response= await sqlDb.UpdateData("UPDATE from  notes SET 'note'= 'note six' WHERE id =6 ");
                  print("$response");
                },
                child: Text("Update Data"),
              ),
            ),
          ],


        ),
      ),


    );
  }
}

