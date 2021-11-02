import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:tarea3/UI/Pages/Login/login_page.dart';
import 'package:tarea3/UI/Pages/Register/register_page.dart';
import 'package:tarea3/UI/Pages/Sumar/suma_widget.dart';
import 'package:tarea3/UI/Routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes =>{
  Routes.LOGIN: (_)=> const LoginPage(),
  Routes.REGISTER: (_)=> RegisterPage(),
  Routes.HOME: (_)=> Suma()
};