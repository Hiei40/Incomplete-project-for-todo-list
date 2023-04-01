import 'package:flutter/material.dart';
import 'package:untitled3/SQLDB.dart';
import 'dart:async' show Future;
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  SqlDb sqlDb=SqlDb();
  Future<List<Map>>readData()async{
    List<Map> response= await sqlDb.readData("SELECT * FROM notes");
return response;
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
 floatingActionButton: FloatingActionButton(

   child: Icon(Icons.add),
     onPressed: () { 
     Navigator.of(context).pushNamed("addNotes");
     }
 ),
      body:Container(
   child: ListView(
 children: [

//    MaterialButton(onPressed: ()async{
//
// await sqlDb.mydeleteDatabase();
//
//    },child: Text("delete database"),),
FutureBuilder(
  future:readData(),
   builder:(BuildContext context,AsyncSnapshot<List<Map>>snapshot)  {
 if(snapshot.hasData){
 return ListView.builder(
   itemCount:snapshot.data!.length ,
     physics:NeverScrollableScrollPhysics(),
     shrinkWrap:true,
     itemBuilder:(context,i){
       return Card(
           child: ListTile(
        title:    Text("${snapshot.data![i]['note']}"),
         subtitle: Text("${snapshot.data![i]['note']}"),
             trailing: Text("${snapshot.data![i]['note']}"),
           ));

 }

 );

 }
 return Center(child: CircularProgressIndicator());


 }
),
   ],
 ),
    ) ,




    );

  }

}
