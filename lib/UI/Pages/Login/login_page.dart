import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/Data/Repositories/Authentication/FirebaseAuthtenticationRepository.dart';

import 'package:tarea3/UI/Routes/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //SqliteLoginRepository sqliteLoginRepository = SqliteLoginRepository();
  String mensaje = "";
  TextEditingController correoController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var auth = new FirebaseAuthenticationRepository();
  @override
  void dispose() {
    correoController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text("Iniciar Sesion"),
                  TextField(
                    controller: correoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Correo",
                    ),
                  ),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Contraseña",
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      auth.doLogin(correoController.text.toString(), passController.text.toString())
                      .then((value){
                            print("logueado ");
                        Navigator.pushNamed(context, Routes.HOME);
                      })
                      .catchError((error){
                        print(error.toString());
                        setState(() {
                          mensaje = error.toString();
                        });
                      });
                    },
                    child: const Text("Iniciar"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context,Routes.REGISTER);
                    },
                    child: const Text("Registrar"),
                  ),
                )
              ],
            ),
            Text(mensaje, style: const TextStyle(color: Colors.red))
          ],
        ),
      )),
    );
  }
/*
  Future<bool> _validarIngreso() async {
    var validar = await sqliteLoginRepository.login(
        correoController.text.toString(), passController.text.toString());
  
    //if (validar.isNotEmpty) return true;

    return false;
  }*/
}
