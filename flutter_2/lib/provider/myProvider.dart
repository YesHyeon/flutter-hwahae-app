import 'package:flutter/material.dart';

class UserInfos with ChangeNotifier {
  String _id, _nickname, _type;
  String get id => _id;
  String get nickname => _nickname;
  String get type => _type;

  void addUserInfo(userInfos) {
    _id = userInfos['username'];
    _nickname = userInfos['nickname'];
    _type = userInfos['type'];
    notifyListeners();
  }

  void editUserInfo(userInfos) {
    if (userInfos['username'] != null) {
      _id = userInfos['username'];
    }

    if (userInfos['nickname'] != null &&
        userInfos['nickname'] != ' ' &&
        userInfos['nickname'] != '') {
      _nickname = userInfos['nickname'];
    }

    if (userInfos['type'] != null) {
      _type = userInfos['type'];
    }

    notifyListeners();
  }
}
