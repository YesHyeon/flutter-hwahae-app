import 'package:flutter/material.dart';
import 'package:flutter_2/src/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key});

  // AppBar, TabBar, Tab, TabBarView
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage_Stateless(),
    );
  }
}

class MyHomePage_Stateless extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:  Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.tag_faces)),
            Tab(text: '메뉴 2'),
            Tab(icon: Icon(Icons.info), text: '메뉴3'),
          ],
        )
      ),
    body:
    TabBarView(
    children: [Container(color: Colors.yellow),
    Container(color: Colors.orange),
    Container(color: Colors.red)]
    ),
    ),
    );
  }
}