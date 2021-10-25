import 'package:tarea3/Domain/Entities/DB.dart';
import 'package:tarea3/Domain/Entities/Usuario.dart';
import 'package:tarea3/Domain/Repositories/abstract_register.dart';

class SqliteRegisterRepository extends AbstractRegister{
  @override
  Future<int> registro(Usuario usuario) async{
    
    return await DB.insert(usuario);
  }

}