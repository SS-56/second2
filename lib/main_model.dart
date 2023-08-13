import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String shinText = 'お寿司';

  void changeShinText() {
    shinText = '正直、超絶モテます';
    notifyListeners();
  }
}
