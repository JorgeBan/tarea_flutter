
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3/UI/Pages/Login/login_page.dart';
import 'package:tarea3/UI/Widgets/text_field_pass_widget.dart';
import 'package:tarea3/UI/Widgets/text_field_widget.dart';

import '../../../suma_widget.dart';

class RegisterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageRegister(),
      ),
    );
  }

}

class PageRegister extends StatefulWidget{
  @override
  PageRegisterState createState() => PageRegisterState();
  
}

class PageRegisterState extends State<PageRegister>{
  @override
  Widget build(BuildContext context) {
   
return Center(
      child: Padding(padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Registro"),
                FreeText(title: "Nombre"),
                FreeText(title: "Email"),
                FreeText(title: "Telefono"),
                FreeText(title: "Direccion"),
                FreeText(title: "Genero"),
                TextPassword(),
                TextPassword(),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child:TextButton(
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
                      MaterialPageRoute(builder: (context)=> LoginPage()) 
                    );
                  },
                  child: Text("Iniciar"),
                ),
              )
              
            ],
          )
        ],
      ),
      )
    );
  }
}