import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  const MainPage({Key key, this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      "수분크림": [
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
      "마스크팩": [
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
      "쉐이빙크림": [
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
      ]
    };
    user = [
      {"id": "testid", "type": "건성", "nickname": "현이"}
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
                      Text(
                        "${user[0]['type']} 피부타입에 알맞는 ${choice} 추천 결과입니다.",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Expanded(
                          child: ListView.builder(
                              key: const PageStorageKey("LIST_VIEW"),
                              itemCount: datas[choice].length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('나중에'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('제출하기'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Container(
                                          child: Text((index + 1).toString(),
                                              style: const TextStyle(
                                                  fontSize: 40)),
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 20, bottom: 20),
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
                                            Text(datas[choice][index]["name"]),
                                            Text(datas[choice][index]["star"]),
                                            Text(
                                                datas[choice][index]["comment"])
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
                            "\n\"${user[0]['nickname']}\"님의 피부타입(${user[0]['type']}) 맞춤 제품들을 추천해드릴게요.",
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
                      Text(
                        "${user[0]['type']} 피부타입에 알맞는 ${choice} 추천 결과입니다.",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Expanded(
                          child: ListView.builder(
                              key: const PageStorageKey("LIST_VIEW"),
                              itemCount: datas.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: Row(
                                    children: [
                                      Container(
                                        child: Text((index + 1).toString(),
                                            style:
                                                const TextStyle(fontSize: 40)),
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 20, bottom: 20),
                                      ),
                                      ClipRRect(
                                          child: Image.asset(
                                        datas[index]["image"].toString(),
                                        height: 100,
                                        width: 100,
                                      )),
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(datas[index]["name"]),
                                          Text(datas[index]["star"]),
                                          Text(datas[index]["comment"])
                                        ],
                                      ))
                                    ],
                                  )),
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
    }
    ;
  }
}
