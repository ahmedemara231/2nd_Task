import 'package:sqflite/sqflite.dart';

late Database db;

void createDatabase(String path)
{
   openDatabase(
    '${path}',
    version: 2,
  onCreate: (db, version)
    {
      db.execute("CREATE TABLE Notes ('id' INTEGER PRIMARY KEY AUTOINCREMENT,'note' TEXT)").then((value)
      {
        print('Table Created');
      });
      },
    // onUpgrade: (db, oldVersion, newVersion) async
    // {
    //   print('on upgrade===========');
    //   await db.rawUpdate("ALTER TABLE Notes ADD COLUMN 'date' TEXT");
    // },

  ).then((value)
  {
    print(db = value);
  });
}

 dynamic insertToDatabase(String note , String date) {
  try {
    db.transaction((txn) async {
      int id1 = await txn.rawInsert("INSERT INTO Notes (note) VALUES('$note , $date')");
      print(id1);
    });
  } catch (error) {
    print('error : ${error.toString()}');
  }
}

Future<int> updataData(String sql) async
{
 return await db.rawUpdate(sql);
 // print(updatedData);
}


Future<List<Map<String, dynamic>>?> getDataFromDatabase() async
{
   List<Map<String, dynamic?>>? data= await db.rawQuery("SELECT * FROM notes");
  return data;
}

Future<int> deleteData(String sql) async
{
  return await db.rawDelete(sql);
}

void deleteDatabase(sql)
{
  db.rawDelete(sql);
}
