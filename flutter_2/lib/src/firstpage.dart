import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_2/src/recoPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _change = 130;
  Alignment _alignment = Alignment.topCenter;
  dynamic _mainAxisAlignment = MainAxisAlignment.start;
  double _elevation = 1.0;

  void _widthChange() {
    setState(() {
      final random = Random();
      _change = random.nextInt(200).toDouble() + 100;
      _alignment = Alignment.topLeft;
      _mainAxisAlignment = MainAxisAlignment.center;
      _elevation = 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        Align(
            alignment: _alignment,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  TextField(),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email', // 힌트
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), // 외각선
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            )),
        ElevatedButton(
          child: Text('change'),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
        ),
      ],
    ));
  }
}
