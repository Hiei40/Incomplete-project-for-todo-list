import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialdb();
      return _db;
    }
    return null;
    // عشان الداتا بيز
  }

  intialdb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db');
    ;
    Database mydb = await openDatabase(path,
        onCreate: _ocreateDB, version: 5, onUpgrade: _onupgrade);
    return mydb;
  }

  // بيتاكد من الداتا بيز
  _ocreateDB(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
   CREATE TABLE notes(
 id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  note TEXT NOT NULL
  
 
  )
   
   
   
   
   ''');
    print("onCreate========");
// بيعمل create for data base
  }

  _onupgrade(Database db, int oldversion, int newversion) async {
    print("onupgrade========");
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  UpdateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  DeleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db');
    ;
    await deleteDatabase(path);
  }
}
