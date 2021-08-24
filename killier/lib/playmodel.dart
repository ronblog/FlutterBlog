import 'package:flutter/cupertino.dart';

class PlayModel with ChangeNotifier
{
  List<String> _playerList = [];
  List<String> get players => _playerList;
  set playerList(List<String> lt) {
    _playerList = lt;
    print("==========_playerList========================");
    print(_playerList);
    print("==================================");
    notifyListeners();
  }

  List<String> _roleList = [];
  List<String> get roles => _roleList;
  set roleList(List<String> lt) {
    _roleList = lt;
    print("===========_roleList=======================");
    print(_roleList);
    print("==================================");
    notifyListeners();
  }

}