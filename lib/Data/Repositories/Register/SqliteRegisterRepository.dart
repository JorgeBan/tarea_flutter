import 'package:sqflite/sqflite.dart';
import 'package:tarea3/Domain/Entities/DB.dart';
import 'package:tarea3/Domain/Entities/Usuario.dart';
import 'package:tarea3/Domain/Repositories/abstract_register.dart';

class SqliteRegisterRepository extends AbstractRegister{
  @override
  Future<int> registro(Usuario usuario) async{
    
    Database database = await DB.openDB();
    var usuario2 =await  database.rawQuery("select * from usuario where correo = ? ",[usuario.correo] );
    if(usuario2.length > 0){
      return -1;
    }
    return database.insert("usuario", usuario.toMap());
  }

}