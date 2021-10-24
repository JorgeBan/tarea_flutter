import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeText extends StatefulWidget{
  const FreeText({Key?key, required this.title}):super(key: key);
  
  final String title;
  
  @override
  _FreeTextState createState() => _FreeTextState();

}

class _FreeTextState extends State<FreeText>{
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: widget.title,
                  ),
                ),
              ),
    );
  }
}