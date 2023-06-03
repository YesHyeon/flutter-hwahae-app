import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ffi';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController textController = TextEditingController();
  String serverResponse = '';

  void sendDataToServer(String text) async {
    var url = Uri.parse('http://127.0.0.1:8000/upload/');
    var response = await http.post(url, body: {'text': text});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      serverResponse = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Django Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Django Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your text:',
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  sendDataToServer(textController.text);
                },
                child: Text('Send'),
              ),
              SizedBox(height: 10),
              Text(
                'Server Response:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(serverResponse),
            ],
          ),
        ),
      ),
    );
  }
}
