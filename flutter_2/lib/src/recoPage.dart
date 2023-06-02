import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter_2/provider/myProvider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key, this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  setData() async {
    final cosmetics = db.collection("cosmetics");

    final data1 = <String, String>{
      "image": "assets/images/skin1.jpg",
      "name": "아쿠아 오아시스 토너",
      "comment": "자극적인 성분이 없어서 좋아요3",
      "star": "4.6",
      "review": "10"
    };

    cosmetics.doc("1").set(data1);
    print('setData');
  }

  getData() async {
    final docRef = db.collection("cosmetics").doc("1");

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  final category = ['스킨', '로션', '에센스', '수분크림', '마스크팩', '쉐이빙크림'];
  final skinTypeDescription = {
    '건성':
        '건성 피부는 메마른 피부에 수분을 충전하고 건조함을 악화시키지 않도록 스킨케어 각 단계마다 수분을 유지하거나 공급하는 제품을 사용해야 합니다!',
    "지성":
        "지성 피부는 번들거리는 피부로 인해 종종 트러블이 발생할 수 있어요.\n항상 수분크림과 진정 성분이 있는 보습제를 사용해야합니다!",
    "복합성": "복합성 피부는 특히 T존이라고 불리는\n이마,코,턱에 유분이 생기지 않도록 해야하고 뺨에는 보습을 충전해야해!"
  };
  dynamic datas;
  List<Map<String, String>> user = [];
  int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    // 제품추천에 필요한 데이터 형식
    datas = {
      "스킨": [
        {
          "image": "assets/images/skin1.jpg",
          "name": "아쿠아 오아시스 토너",
          "comment": "자극적인 성분이 없어서 좋아요",
          "star": "4.6",
          "review": "10"
        },
        {
          "image": "assets/images/skin2.jpg",
          "name": "다이브인 저분자 히알루론산 토너",
          "comment": "토너의 역할에 충실한 제품",
          "star": "4.43",
          "review": "10"
        },
        {
          "image": "assets/images/skin3.jpg",
          "name": "다이브인 저분자 히알루론산 토너",
          "comment": "토너의 역할에 충실한 제품",
          "star": "4.13",
          "review": "10"
        },
        {
          "image": "assets/images/skin4.jpg",
          "name": "다이브인 저분자 히알루론산 토너",
          "comment": "토너의 역할에 충실한 제품",
          "star": "4.03",
          "review": "10"
        },
        {
          "image": "assets/images/skin5.jpg",
          "name": "다이브인 저분자 히알루론산 토너",
          "comment": "토너의 역할에 충실한 제품",
          "star": "4.00",
          "review": "10"
        }
      ],
      "로션": [
        {
          "image": "assets/images/lotion1.jpg",
          "name": "알리윤 세라마이드 아토 로션",
          "comment": "가렵지않아요",
          "star": "4.92",
          "review": "10"
        },
        {
          "image": "assets/images/lotion2.jpg",
          "name": "싸이닉 더 심플 데일리 로션",
          "comment": "약산성이고 가벼워요",
          "star": "4.63",
          "review": "10"
        },
        {
          "image": "assets/images/lotion3.jpg",
          "name": "아토팜 MLE 로션",
          "comment": "보습되는데 끈적임이 없어요",
          "star": "4.57",
          "review": "10"
        },
        {
          "image": "assets/images/lotion4.jpg",
          "name": "아토팜 수딩 젤 로션",
          "comment": "가렵지 않아서 좋아요",
          "star": "4.43",
          "review": "10"
        },
        {
          "image": "assets/images/lotion5.jpg",
          "name": "라운드랩 1025 독도 로션",
          "comment": "흡수가 빠르고 남자들이 쓰기 좋아요",
          "star": "4.30",
          "review": "10"
        }
      ],
      "에센스": [
        {
          "image": "assets/images/essense1.jpg",
          "name": "에스네이처 아쿠아 스쿠알란 세럼",
          "comment": "자극업고 끈적하지 않아요",
          "star": "4.95",
          "review": "10"
        },
        {
          "image": "assets/images/essense2.jpg",
          "name": "에스네이처 아쿠아 콜라겐 젤 에센스",
          "comment": "잘발려요 너무",
          "star": "4.86",
          "review": "10"
        },
        {
          "image": "assets/images/essense3.jpg",
          "name": "토리든 다이브인 세럼",
          "comment": "속건조 해결돼요",
          "star": "4.76",
          "review": "10"
        },
        {
          "image": "assets/images/essense4.jpg",
          "name": "다자연 어성초 케어 세럼",
          "comment": "진정되는게 좋아요",
          "star": "4.74",
          "review": "10"
        },
        {
          "image": "assets/images/essense5.jpg",
          "name": "비플레인 시카테롤 앰플",
          "comment": "흡수되는 속도가 빨라오",
          "star": "4.54",
          "review": "10"
        }
      ],
      "수분크림": [
        {
          "image": "assets/images/waterCream1.jpg",
          "name": "토리든 다이브인 수딩크림",
          "comment": "가볍고 산뜻하게",
          "star": "4.94",
          "review": "10"
        },
        {
          "image": "assets/images/waterCream2.jpg",
          "name": "에스트라 아토베리어 365 크림",
          "comment": "속건조가 해결돼서 좋아요",
          "star": "4.73",
          "review": "10"
        },
        {
          "image": "assets/images/waterCream3.jpg",
          "name": "에스네이처 아쿠아 스쿠알란 수분크림",
          "comment": "바르면 윤기가 나요 유분 많아요",
          "star": "4.70",
          "review": "10"
        },
        {
          "image": "assets/images/waterCream4.jpg",
          "name": "피지오겔 DMT 페이셜 크림",
          "comment": "뒤집어지지 않아요",
          "star": "4.53",
          "review": "10"
        },
        {
          "image": "assets/images/waterCream5.jpg",
          "name": "메이크프렘 인테카 수딩 크림",
          "comment": "자극이 조금 돼요",
          "star": "4.35",
          "review": "10"
        }
      ],
      "마스크팩": [
        {
          "image": "assets/images/mask1.jpg",
          "name": "토리든 다이브인 마스크팩",
          "comment": "자극적인 성분이 없요",
          "star": "4.9",
          "review": "10"
        },
        {
          "image": "assets/images/mask2.jpg",
          "name": "다자연 어성초 마스크팩",
          "comment": "여드름 줄들어요",
          "star": "4.83",
          "review": "10"
        },
        {
          "image": "assets/images/mask3.jpg",
          "name": "백아울 모이스처 밸런싱 마스크",
          "comment": "밀착되고 에센스가 많아요",
          "star": "4.54",
          "review": "10"
        },
        {
          "image": "assets/images/mask4.jpg",
          "name": "비플레인 시카풀 카밍 마스크",
          "comment": "진정되어요",
          "star": "4.03",
          "review": "10"
        },
        {
          "image": "assets/images/mask5.jpg",
          "name": "듀이트리 AC 컨트롤 EX 딥마스크",
          "comment": "쿨링기능이 있어요",
          "star": "4.00",
          "review": "10"
        }
      ],
      "쉐이빙크림": [
        {
          "image": "assets/images/shaving1.jpg",
          "name": "플리프 시카알로에 쉐이빙크림",
          "comment": "쿨링돼요",
          "star": "4.3",
          "review": "10"
        },
        {
          "image": "assets/images/shaving2.jpg",
          "name": "러쉬 더티 쉐이빙 크림",
          "comment": "알갱이가 있어서 각질도 제거돼요",
          "star": "4.23",
          "review": "10"
        },
        {
          "image": "assets/images/shaving3.jpg",
          "name": "불독 오리지널 쉐이브 크림",
          "comment": "거품이 잘 안나요",
          "star": "4.13",
          "review": "10"
        },
        {
          "image": "assets/images/shaving4.jpg",
          "name": "더바디샵 포맨 쉐이브 크림",
          "comment": "건조하지만 자극 없어요",
          "star": "4.03",
          "review": "10"
        },
        {
          "image": "assets/images/shaving5.jpg",
          "name": "록시땅 리치 쉐이브 크림",
          "comment": "향이 좋아요",
          "star": "4.00",
          "review": "10"
        }
      ]
    };
    user = [
      {"id": "hong@naver.com", "type": "건성", "nickname": "노현"}
    ];
    // 루틴추천에 필요한 데이터 형식
  }

  Widget build(BuildContext context) {
    switch (_currentPageIndex) {
      case 0:
        return DefaultTabController(
            length: category.length,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "추천목록",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                  actions: [],
                  bottom: TabBar(
                    tabs: category.map((String choice) {
                      return Tab(text: choice);
                    }).toList(),
                    isScrollable: true,
                    indicatorColor: Colors.transparent, // indicator 없애기
                    unselectedLabelColor: Colors.black, // 선택되지 않은 tab 색
                    labelColor: Colors.green,
                  ),
                ),
                body: TabBarView(
                  children: category.map((String choice) {
                    return Center(
                        // children: [],
                        child: Column(children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "${context.watch<UserInfos>().nickname.toString()}님의 \'${context.watch<UserInfos>().type.toString()}\'피부 타입에 알맞는 ${choice} 추천 결과입니다.",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          child: ListView.builder(
                              key: const PageStorageKey("LIST_VIEW"),
                              itemCount: datas[choice].length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('리뷰를 남겨주세요'),
                                        content: const TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: '긍정/부정을 판단합니다.', // 힌트
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => {
                                              Navigator.pop(context, 'Cancel'),
                                              getData()
                                            },
                                            child: const Text('나중에'),
                                          ),
                                          TextButton(
                                            onPressed: () => {
                                              Navigator.pop(context, 'OK'),
                                              print('click'),
                                              setData()
                                            },
                                            child: const Text('제출하기'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Container(
                                          child: Text((index + 1).toString(),
                                              style: const TextStyle(
                                                  fontSize: 40)),
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 20, bottom: 20),
                                        ),
                                        ClipRRect(
                                            child: Image.asset(
                                          datas[choice][index]["image"]
                                              .toString(),
                                          height: 100,
                                          width: 100,
                                        )),
                                        Container(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              datas[choice][index]["name"],
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                "${datas[choice][index]["star"]}\(${datas[choice][index]['review']}\)"),
                                            Text(
                                                datas[choice][index]["comment"],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ))
                                          ],
                                        ))
                                      ],
                                    )),
                                  ),
                                );
                              }))
                    ]));
                  }).toList(),
                ),
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (int index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                      print(index);
                    },
                    currentIndex: _currentPageIndex,
                    selectedItemColor: Colors.green,
                    items: [
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.storefront),
                        label: '제품추천',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.star),
                        label: '루틴추천',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: '내정보',
                      ),
                    ])));
        break;
      case 1:
        return DefaultTabController(
            length: category.length,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "루틴추천",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                  actions: [],
                ),
                body: Column(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Column(children: [
                          Text(
                            "${skinTypeDescription[user[0]['type']]}",
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            "\n\"${context.watch<UserInfos>().nickname.toString()}\"님의 피부타입(${context.watch<UserInfos>().type.toString()}) 맞춤 제품들을 추천해드릴게요.",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Georgia'),
                          )
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )),
                    Expanded(
                        child: ListView.builder(
                            key: const PageStorageKey("LIST_VIEW"),
                            itemCount: category.length,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                          "${index + 1}단계: ${category[index]}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      padding: const EdgeInsets.only(left: 0),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black)),
                                      ),
                                      child: Row(children: [
                                        ClipRRect(
                                            child: Image.asset(
                                          datas[category[index]][0]["image"]
                                              .toString(),
                                          height: 100,
                                          width: 100,
                                        )),
                                        Container(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              datas[category[index]][0]["name"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(datas[category[index]][0]
                                                ["star"]),
                                            Text(
                                              datas[category[index]][0]
                                                  ["comment"],
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ))
                                      ]),
                                    )
                                  ],
                                )),
                              );
                            })),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (int index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                      print(index);
                    },
                    currentIndex: _currentPageIndex,
                    selectedItemColor: Colors.green,
                    items: [
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.storefront),
                        label: '제품추천',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.star),
                        label: '루틴추천',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: '내정보',
                      ),
                    ])));
        break;
      case 2:
        return DefaultTabController(
            length: category.length,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "내정보",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                  actions: [],
                ),
                body: Center(
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
                                      child: Image.asset(
                                          "assets/images/profile.png"),
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
                                            fontFamily: 'Georgia',
                                            fontSize: 15),
                                      )
                                    ]),
                                  ),
                                ]),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 0,
                                  blurRadius: 5.0,
                                  offset: Offset(
                                      0, 10), // changes position of shadow
                                ),
                              ],
                            )),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('피부타입 테스트 다시하기'),
                        )
                      ]),
                ),
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (int index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                      print(index);
                    },
                    currentIndex: _currentPageIndex,
                    selectedItemColor: Colors.green,
                    items: [
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.storefront),
                        label: '제품추천',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.star),
                        label: '루틴추천',
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: '내정보',
                      ),
                    ])));
        break;
    }
    ;
  }
}
