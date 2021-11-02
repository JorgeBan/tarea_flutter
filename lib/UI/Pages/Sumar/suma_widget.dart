import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tarea3/Data/Repositories/Authentication/FirebaseAuthtenticationRepository.dart';
import 'package:tarea3/UI/Routes/routes.dart';

class Suma extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sumar 2 numeros',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SumaPage(title: 'Sumar 2 numeros'),
    );
  }
}

class SumaPage extends StatefulWidget {
  SumaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SumaPageState createState() => _SumaPageState();
}

class _SumaPageState extends State<SumaPage> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  int result = 0;
  final _auth = FirebaseAuthenticationRepository();
  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textController1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero 1',
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textController2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero 2',
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () async {
                            final resultado = await sumar(
                                textController1.text, textController2.text);
                            setState(() {
                              result = resultado;
                            });
                          },
                          child: const Text("="))),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(result.toString())),
                  ),
              ],
              ),
              FloatingActionButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Cerrar sesion'),
                          content: Text("Seguro que desea cerrar sesion?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: (){
                                _auth.doLogout().then((value){
                                  Navigator.pushNamed(context, Routes.LOGIN);
                                }).catchError((onError){
                                  print(onError.toString());  
                                });                                
                              },
                              child: const Text('Si'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Icon(Icons.door_back),
                    backgroundColor: Colors.red,
                  ),

            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  String URL_API = 'https://api-suma-nodejs.herokuapp.com';

  Future<int> sumar(valor1, valor2) async {
    if (valor1.toString().isEmpty || valor2.toString().isEmpty) return 0;

    var url = Uri.parse(URL_API + '/sumar/$valor1/$valor2');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);

    return int.parse(data['resul'].toString());
  }
}
