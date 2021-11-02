import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/UI/Routes/app_routes.dart';
import 'package:tarea3/UI/Routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: Routes.LOGIN ,
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
