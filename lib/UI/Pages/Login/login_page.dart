import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/UI/Pages/Register/register_page.dart';
import 'package:tarea3/UI/Widgets/text_field_pass_widget.dart';
import 'package:tarea3/UI/Widgets/text_field_widget.dart';
import 'package:tarea3/suma_widget.dart';

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
                FreeText(title: "Email"),
                TextPassword()
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
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=> Suma())
                     );
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
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=> RegisterPage())
                     );
                  },
                  child: Text("Registrar"),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
