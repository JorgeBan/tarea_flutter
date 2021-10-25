import 'package:tarea3/Domain/Entities/DB.dart';
import 'package:tarea3/Domain/Repositories/abstract_login.dart';

class SqliteLoginRepository extends AbstractLogin{
  @override
  Future<List<Map<String, Object?>>> login(String correo, String pass) async{
    return await DB.getLogin(correo, pass);
  }

}