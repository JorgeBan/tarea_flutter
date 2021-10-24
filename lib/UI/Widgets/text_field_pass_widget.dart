import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPassword extends StatefulWidget{
  const TextPassword({Key?key}):super(key: key);


  @override
  _TextPasswordState createState() => _TextPasswordState();
  
  
}

class _TextPasswordState extends State<TextPassword>{
  @override
  Widget build(BuildContext context) {
 
    return Container(
      child:  Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                     obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  ),
                ),
              ),
    );
  }
}