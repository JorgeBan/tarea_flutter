import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/UI/Pages/my_app.dart';
import 'UI/Pages/Sumar/suma_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges()
  .listen((User? user) {
    if(user == null){
      runApp(MyApp());
    }else{
      runApp(Suma());
    }
   });
 
}



