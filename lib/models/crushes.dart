import 'package:flutter/material.dart';

class crushesData extends ChangeNotifier {
  List<String> _crushes = [
    'Pusha',
    'Shipla',
    'Amdhu',
  ];

  List<String> get crushes => _crushes;

  void deleteCrush(int index) {
    _crushes.removeAt(index);
    notifyListeners();
  }

  // List<String> getCrushes() {
  //   return crushes;
  // }
}
