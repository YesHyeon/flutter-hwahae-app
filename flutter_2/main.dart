import 'package:flutter/material.dart';
import 'package:flutter_2/firebase_options.dart';
// import 'package:flutter_2/src/firstpage.dart';
import 'package:flutter_2/src/loginPage.dart';
import 'package:flutter_2/src/recoPage.dart';
import 'package:flutter_2/src/register.dart';
import 'package:flutter_2/src/skinTypeTestPage.dart';
import 'package:flutter_2/src/profileEdit.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_2/firebase_options.dart';

import 'package:provider/provider.dart';
import 'package:flutter_2/provider/myProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserInfos()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key});

  // Center
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: MyHomePage_Stateless(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/register': (context) => RegisterPage(),
        '/skinTypeTest': (context) => SkinTypeTestPage(),
        '/profileEdit': (context) => ProfileEditPage(),
      },
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
