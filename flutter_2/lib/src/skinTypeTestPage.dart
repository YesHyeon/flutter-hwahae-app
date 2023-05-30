
import 'package:flutter/material.dart';

class SkinTypeTestPage extends StatefulWidget {
  @override
  _SkinTypeTestPageState createState() => _SkinTypeTestPageState();
}

class _SkinTypeTestPageState extends State<SkinTypeTestPage> {
  final List<bool> answers = List<bool>.filled(8, null);

  final List<String> questions = [
    '1. 평소 블랙헤드 또는 피지가 많다.',
    '2. 가습기가 없어도 평소에 건조함을 잘 느끼지 못한다.',
    '3. 하루라도 머리를 감지 않으면 금세 기름이 진다',
    '4. 보습이 좋은 제품을 사용하면 피부에 트러블이 난다.',
    '5. 모공이 크고 육안으로도 잘 보인다.',
    '6. 세한 후 당기는 느낌이 별로 없다.',
    '7. 피부가 갈라지는 경우보다 번들거리는 경우가 많다.',
    '8. 건조한 날시에도 유분이 많다.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Type Test'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < questions.length; i++)
                Column(
                  children: [
                    Text(
                      questions[i],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RadioListTile<bool>(
                          title: Text('Yes'),
                          value: true,
                          groupValue: answers[i],
                          onChanged: (value) {
                            setState(() {
                              answers[i] = value;
                            });
                          },
                        ),
                        RadioListTile<bool>(
                          title: Text('No'),
                          value: false,
                          groupValue: answers[i],
                          onChanged: (value) {
                            setState(() {
                              answers[i] = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                  ],
                ),
              SizedBox(height: 24.0),
              ElevatedButton(
                child: Text('뒤로가기'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                child: Text('테스트 결과 확인하기'),
                onPressed: () {
                  int cnt = 0;
                  for (int i = 0; i < answers.length; i++) {
                    if (answers[i] == true) {
                      cnt++;
                    }
                  }
                  String message;
                  if (cnt >= 6) {
                    message = "당신의 피부타입은 지성입니다.";
                  } else if (cnt <= 3) {
                    message = "당신의 피부타입은 건성입니다.";
                  } else {
                    message = "당신의 피부타입은 복합성입니다.";
                  }
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('피부타입 결과'),
                        content: Text(message),
                        actions: [
                          TextButton(
                            child: Text('닫기'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
