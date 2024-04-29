import 'package:flutter/material.dart';

class crushesData extends ChangeNotifier {
  List<String> _crushes = ['Rita', 'Seetha', 'Sherlin'];

  List<String> get crushes => _crushes;

  void deleteCrush(int index) {
    _crushes.removeAt(index);
    notifyListeners();
  }

  void addCrush(String name) {
    _crushes.add(name);
    notifyListeners();
  }

  // List<String> getCrushes() {
  //   return crushes;
  // }
}
