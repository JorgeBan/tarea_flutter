import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB{

 
 static Future<Database> openDB() async {
   
   return openDatabase(join(await getDatabasesPath(), 'usuaios.db'),
       onCreate: (db, version) {
     return db.execute(
       "CREATE TABLE usuario (id INTEGER PRIMARY KEY, nombre TEXT, correo TEXT, telefono INTEGER, direccion TEXT, genero TEXT, pass TEXT)",
     );
   }, version: 1);
 }
 
}