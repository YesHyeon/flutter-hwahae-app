import 'package:flutter/material.dart';
import 'package:flutter_2/src/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _gender;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  void _signup() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String nickname = _nicknameController.text;
    String type = _gender;
    dynamic savedUserInfo;
    print(username);
    print(password);
    print(nickname);
    print(type);
    dynamic isSigned = await AuthManage().createUser(username, password);
    isSigned
        ? await fireStore.collection('users').doc().set({
            "id": username,
            "nickname": nickname,
            "password": password,
            "type": type,
          })
        : print('데이터 전달 불가능');

    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "회원가입",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nicknameController,
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
