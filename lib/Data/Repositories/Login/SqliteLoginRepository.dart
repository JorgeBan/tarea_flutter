import 'package:sqflite/sqflite.dart';
import 'package:tarea3/Domain/Entities/DB.dart';
import 'package:tarea3/Domain/Entities/Usuario.dart';
import 'package:tarea3/Domain/Repositories/abstract_login.dart';

class SqliteLoginRepository extends AbstractLogin{
  @override
  Future<Usuario> login(String correo, String pass) async{
    Database database = await DB.openDB();
    var res = await database.rawQuery("SELECT * FROM Usuario WHERE correo = '$correo' and pass = '$pass'");
    print("usuario: ");
    print(res);
    //return res;
    return new Usuario(nombre: "JOrge", correo: "correo", telefono: 556565, direccion: "direccion", genero: "genero", pass: "pass");
  }

  @override
  Future<void> doLogout() {
    throw UnimplementedError();
  }

}