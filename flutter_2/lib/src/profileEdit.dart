import 'package:flutter/material.dart';
import 'package:flutter_2/src/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'package:flutter_2/provider/myProvider.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String _gender;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  void _edit() async {
    String nickname = _nicknameController.text;
    String type = _gender;
    dynamic savedUserInfo;

    print(nickname);
    print(type);

    context
        .read<UserInfos>()
        .editUserInfo({'nickname': nickname, 'type': _gender});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // _gender = context.watch<UserInfos>().type.toString();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "프로필 수정",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Image.asset("assets/images/profile.png"),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10)),
                          Container(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(children: [
                              Text(
                                "닉네임: ${context.watch<UserInfos>().nickname.toString()}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "아이디: ${context.watch<UserInfos>().id.toString()}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "피부타입: ${context.watch<UserInfos>().type.toString()}",
                                style: const TextStyle(
                                    fontFamily: 'Georgia', fontSize: 15),
                              )
                            ]),
                          ),
                        ]),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    )),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: _nicknameController,
                          decoration: InputDecoration(
                            labelText:
                                'Current Nickname: ${context.watch<UserInfos>().nickname.toString()}',
                          ),
                        ),
                        SizedBox(height: 16.0),
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
                        SizedBox(height: 24.0),
                        ElevatedButton(
                          child: Text('수정하기'),
                          onPressed: () {
                            _edit();

                            // 회원가입 버튼 동작 구현
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
