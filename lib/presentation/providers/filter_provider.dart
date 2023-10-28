import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String _state = "all";

  String get filterState => _state;

  set filterState(String value) {
    _state = value;
    notifyListeners();
  }
}
