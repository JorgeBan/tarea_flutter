import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/Data/Repositories/Register/SqliteRegisterRepository.dart';
import 'package:tarea3/Domain/Entities/Usuario.dart';
import 'package:tarea3/UI/Pages/Login/login_page.dart';

import '../Sumar/suma_widget.dart';

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
  SqliteRegisterRepository registerRepository = new SqliteRegisterRepository();

  String dropdownValue = "Masculino";

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
            child: SingleChildScrollView(
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
                          child: Container(
                            width: 300,
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 20,
                              elevation: 16,
                              style: const TextStyle(color: Colors.blue),
                              underline: Container(
                                height: 2,
                                color: Colors.blueAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Masculino',
                                'Femenino'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
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
                          onPressed: () async {
                            mensaje = "";
                            int validar = _validarCampos();
                            setState(() {
                              if (validar == 100) {
                                mensaje = "Debe llenar todos los campos";
                              } else if (validar == 200) {
                                mensaje = "Telefono no valido";
                              } else if (validar == 300) {
                                mensaje = "Las contraseñas no coinciden";
                              } else if (validar == 400) {
                                mensaje = "ingrese un email valido";
                              }
                            });

                            if (validar == 0) {
                              Usuario usuario = new Usuario(
                                  id: Random().nextInt(5000),
                                  nombre: nombreController.text,
                                  correo: correoController.text,
                                  telefono: int.parse(
                                      telefonoController.text.toString()),
                                  direccion: direccionController.text,
                                  genero: dropdownValue,
                                  pass: passController.text);

                              var id =
                                  await registerRepository.registro(usuario);
                              if (id > 0) {
                                final snackBar = SnackBar(
                                  content: Text("Registro exitoso"),
                                  action: SnackBarAction(
                                    label: "Ok",
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Suma()));
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                print("registro exitoso: $id");
                              } else {
                                var snackBar;

                                if (id == -1) {
                                  snackBar = SnackBar(
                                    content: Text("Correo ya registrado"),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      onPressed: () {},
                                    ),
                                  );
                                } else {
                                  snackBar = SnackBar(
                                    content: Text("Ups hubo un error"),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      onPressed: () {},
                                    ),
                                  );
                                }

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
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
            )));
  }

  int _validarCampos() {
    if (nombreController.text.toString().isEmpty ||
        correoController.text.toString().isEmpty ||
        telefonoController.text.toString().isEmpty ||
        direccionController.text.toString().isEmpty ||
        passController.text.toString().isEmpty ||
        passConfController.text.toString().isEmpty) {
      return 100;
    }

    if (int.tryParse(telefonoController.text) == null) {
      return 200;
    }

    if (passController.text.toString() != passConfController.text.toString()) {
      return 300;
    }

    /*bool validarEmail = RegExp(r'([a-z0-9] [- a-z0-9 _ +.] [a-z0-9]) @ ([a-z0-9] [- a-z0-9.] [a-z0-9]. (com | net) | ([0-9] {1,3}. {3} [0-9] {1,3})) ').hasMatch(correoController.text.toString());
    if(!validarEmail){
      return 400;
    } 
*/
    return 0;
  }
}
