import 'package:flutter/material.dart';
import 'package:flutter_2/src/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _gender;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signup() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    dynamic isSigned = await AuthManage().createUser(username, password);
    isSigned ? Navigator.pushReplacementNamed(context, '/') : print('로그인 실패');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nickname',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 24.0),

              Column(
                children: <Widget>[
                  RadioListTile(
                    title: Text('건성'),
                    value: '건성',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('복합성'),
                    value: '복합성',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('지성'),
                    value: '지성',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ],
              ),

// 피부타입 표시 부분

              TextButton(
                child: Text('피부타입 테스트하기'),
                onPressed: () {
                  Navigator.pushNamed(context, '/skinTypeTest');
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                child: Text('회원가입'),
                onPressed: () {
                  _signup();

                  // 회원가입 버튼 동작 구현
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
