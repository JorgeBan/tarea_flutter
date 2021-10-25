import 'package:tarea3/Domain/Entities/Usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB{

 
 static Future<Database> _openDB() async {
   
   return openDatabase(join(await getDatabasesPath(), 'usuaios.db'),
       onCreate: (db, version) {
     return db.execute(
       "CREATE TABLE usuario (id INTEGER PRIMARY KEY, nombre TEXT, correo TEXT, telefono INTEGER, direccion TEXT, genero TEXT)",
     );
   }, version: 1);
 }


 static Future<int> insert(Usuario usuario) async {
    Database database = await _openDB();

    return database.insert("usuario", usuario.toMap());
  }

  static Future<int> delete(Usuario usuario) async {
    Database database = await _openDB();

    return database.delete("usuario", where: 'id = ?', whereArgs: [usuario.id]);
  }

  static Future<int> update(Usuario usuario) async {
    Database database = await _openDB();

    return database.update("usuario",usuario.toMap(), where: 'id = ?', whereArgs: [usuario.id]);
  }

  static Future<int> getLogin(String correo, String contrasena) async {
    Database database = await _openDB();
    var res = await database.rawQuery("SELECT * FROM Usuario WHERE correo = '$correo' and password = '$contrasena'");
    
    if (res.length > 0) {
      return 1;
    }
    return 0;
  }
}