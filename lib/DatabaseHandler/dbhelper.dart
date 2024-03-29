
import 'package:path_provider/path_provider.dart';
import 'package:registration_sql/Model/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import 'dart:io' as io;
import 'dart:async';





class DbHelper {
  static Database? _db ;

  static const String DB_Name = 'test.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String C_UserID ='user_id';
  static const String C_UserName ='user_name';
  static const String C_Email ='email';
  static const String C_Password ='password';



  // Future<Directory> getApplicationDocumentsDirectory() async {
  //   final String? path = await _platform.getApplicationDocumentsPath();
  //   if (path == null) {
  //     throw MissingPlatformDirectoryException(
  //         'Unable to get application documents directory');
  //   }
  //   return Directory(path);
  // }
    Future<Database> get db async =>
      _db ??= await initDb();

  initDb () async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db, int intVersion) async{
      await db.execute("CREATE TABLE $Table_User("
         "$C_UserID TEXT, "
          "$C_UserName TEXT, "
          "$C_Email TEXT, "
          "$C_Password TEXT, "
          "PRIMARY KEY ($C_UserID)"
          ")");


  }
   Future<int> saveData(UserModel user) async{
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
   }

  Future<UserModel?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Password = '$password'");

    if(res.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_User, user.toMap(),
      where: '$C_UserID = ?', whereArgs: [user.user_id]);
    print(res);
    return res;
  }
  
  Future<int> deleteUser(String user_id) async {
      var dbClient = await db;
      var res = await dbClient.delete(
        Table_User, where: '$C_UserID = ?' ,whereArgs: [user_id]);
      return res;
  }

}

//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
