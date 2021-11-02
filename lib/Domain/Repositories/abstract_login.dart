import 'package:tarea3/Domain/Entities/Usuario.dart';

abstract class AbstractLogin{

  Future<Usuario> login(String correo, String pass);

  Future<void> doLogout();
}


