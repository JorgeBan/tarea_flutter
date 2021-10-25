import 'package:tarea3/Domain/Entities/Usuario.dart';

abstract class AbstractRegister{

    Future<int> registro(Usuario usuario);
}