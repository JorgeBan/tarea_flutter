import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/Data/Repositories/Login/SqliteLoginRepository.dart';
import 'package:tarea3/UI/Pages/Register/register_page.dart';

import 'package:tarea3/UI/Pages/Sumar/suma_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageLogin(),
      ),
    );
  }
}

class PageLogin extends StatefulWidget {
  const PageLogin({
    Key? key,
  }) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  SqliteLoginRepository sqliteLoginRepository = new SqliteLoginRepository();
  String mensaje = "";
  TextEditingController correoController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  void dispose() {
    correoController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Iniciar Sesion"),
                TextField(
                  controller: correoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo",
                  ),
                ),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
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
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    mensaje = "";
                    bool validar = await _validarIngreso();
                    if (validar) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Suma()));
                    } else {
                      setState(() {
                        mensaje = "Usuario no registrado";
                      });
                    }
                  },
                  child: Text("Iniciar"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text("Registrar"),
                ),
              )
            ],
          ),
          Text(mensaje, style: TextStyle(color: Colors.red))
        ],
      ),
    ));
  }

  Future<bool> _validarIngreso() async {
    var validar = await sqliteLoginRepository.login(
        correoController.text.toString(), passController.text.toString());
  
    if (validar.isNotEmpty) return true;

    return false;
  }
}
