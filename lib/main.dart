import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sumar 2 numeros',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Sumar 2 numeros'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();  
  int result = 0;

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
        child: Padding(padding: EdgeInsets.all(10.0),
        child:Column(
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
                  child: OutlinedButton(onPressed:(){
                    setState(() {
                      suma(textController1.text, textController2.text);
                    });
                   }, 
                  child: const Text("=")) 
                  
                  ),
                  Expanded(
                
                    child: Padding(padding: EdgeInsets.all(30.0), child:Text(result.toString())),)
              ],
            )
          ],
        ), 
        ),
      ),
    );
  }
   void suma(valor1, valor2){
     result = int.parse(valor1) + int.parse(valor2);
     print(result);
   }
}
