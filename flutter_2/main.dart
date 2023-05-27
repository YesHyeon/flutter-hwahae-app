import 'package:flutter/material.dart';
import 'package:flutter_2/src/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key});

  // Center
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage_Stateless(),
    );
  }
}

class MyHomePage_Stateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      ListTile(
        title: Text('화해 앱 제작중', style: TextStyle(fontSize: 40)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    ]));
  }
}
