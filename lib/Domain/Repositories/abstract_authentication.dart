
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tarea3/Domain/Entities/Usuario.dart';

abstract class AbstractAuthentication{
  Future<User?> usuario();

  Future<String> doLogin(String email, String password);
  Future<void> doLogout();

  Future<String> register(Usuario usuario);
}