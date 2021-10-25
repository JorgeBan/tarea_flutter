import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/UI/Pages/Login/login_page.dart';

//import '../../../suma_widget.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageRegister(),
      ),
    );
  }
}

class PageRegister extends StatefulWidget {
  @override
  PageRegisterState createState() => PageRegisterState();
}

class PageRegisterState extends State<PageRegister> {
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController();
  final direccionController = TextEditingController();
  final generoController = TextEditingController();
  final passController = TextEditingController();
  final passConfController = TextEditingController();

  String mensaje = "";

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    telefonoController.dispose();
    direccionController.dispose();
    generoController.dispose();
    passController.dispose();
    passConfController.dispose();
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
                Text("Registro"),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nombre",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: correoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Correo",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: telefonoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Telefono",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: direccionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Direccion",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: generoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Genero",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Contraseña",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: passConfController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirmar Contraseña",
                    ),
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
                  onPressed: () {
                    setState(() {
                      mensaje = "";
                      if (_validarCampos()) {
                        print("registro exitoso");
                      }
                    });
                  },
                  child: Text("Registrar"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Iniciar"),
                ),
              )
            ],
          ),
          Text(mensaje,
              style: TextStyle(
                color: Colors.red,
              )),
        ],
      ),
    ));
  }

  bool _validarCampos() {
    if (nombreController.text.toString().isEmpty ||
        correoController.text.toString().isEmpty ||
        telefonoController.text.toString().isEmpty ||
        direccionController.text.toString().isEmpty ||
        generoController.text.toString().isEmpty ||
        passController.text.toString().isEmpty ||
        passConfController.text.toString().isEmpty) {
      mensaje = "Debe llenar todos los campos";
      return false;
    }

    if (int.tryParse(telefonoController.text) == null) {
      mensaje = "Telefono no valido";
      return false;
    }

    if (passController.text.toString() != passConfController.text.toString()) {
      mensaje = "Las contraseñas no coinciden";
      return false;
    }

    return true;
  }
}
