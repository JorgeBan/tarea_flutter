import 'package:sqflite/sqflite.dart';
import 'package:tarea3/Domain/Entities/DB.dart';
import 'package:tarea3/Domain/Repositories/abstract_login.dart';

class SqliteLoginRepository extends AbstractLogin{
  @override
  Future<List<Map<String, Object?>>> login(String correo, String pass) async{
    Database database = await DB.openDB();
    var res = await database.rawQuery("SELECT * FROM Usuario WHERE correo = '$correo' and pass = '$pass'");
    print("usuario: ");
    print(res);
    return res;
  }

}