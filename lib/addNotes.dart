import 'package:flutter/material.dart';
import 'package:untitled3/SQLDB.dart';
import 'package:untitled3/Todo.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController title = TextEditingController();
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add note"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    controller: note,
                    decoration: InputDecoration(
                      hintText: "note",
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: color,
                    decoration: InputDecoration(
                      hintText: "color",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      int response = await sqlDb.insertData('''
   INSERT INTO notes("note","title","color")
   VALUES ("${note.text}","${title.text}","${color.text}")
   ''');
                      if (response > 0) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Todo()),
                            (route) => false);
                      }
                      print("response=========");
                      print(response);
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("add note"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
