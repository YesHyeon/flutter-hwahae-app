import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_2/src/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_2/provider/myProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    dynamic isSigned = await AuthManage().signIn(username, password);
    if (context.mounted) {
      isSigned
          ? context.read<UserInfos>().addUserInfo(
              {'username': username, 'nickname': 'hong', 'type': '건성'})
          : print('로그인 실패');
      Navigator.pushReplacementNamed(context, '/main');
    }

    // isSigned
    //     ? Navigator.pushReplacementNamed(context, '/main')
    //     : print('로그인 실패');
  }

  // _auth() {
  //   // 사용자 인증정보 확인. 딜레이를 두어 확인
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     if (FirebaseAuth.instance.currentUser == null) {
  //       print('로그인');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 130,
              width: 450,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: _login,
            ),
            SizedBox(height: 8.0),
            TextButton(
              child: Text('Register'),
              onPressed: () async {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
