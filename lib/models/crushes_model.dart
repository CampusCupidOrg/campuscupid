import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrushesData extends ChangeNotifier {
  List<String> _crushes = [];

  List<String> get crushes => _crushes;

  Future<void> deleteCrush(int index) async {
    final dio = Dio();
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString('email');
    final response = await dio.delete(
        'https://campuscupid.social/api/users/delete/${email?.split('@')[0]}/${crushes[index]}');
    response.statusCode == 200 ? _crushes.removeAt(index) : null;
    getCrushes();
    notifyListeners();
  }

  Future<void> addCrush(String name) async {
    // final pref = await SharedPreferences.getInstance();
    // final userId = pref.getString('email')?.split('@')[0];
    // final dio = Dio();
    // final response = await dio
    //     .post('https://campuscupid.social/api/users/create/$userId/${name}');
    // notifyListeners();
  }

  Future<List<String>> getCrushes() async {
    final dio = Dio();
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString('email');
    final response = await dio.get(
        'https://campuscupid.social/api/users/viewmatches/${email?.split('@')[0]}');
    _crushes.clear();
    response.data.forEach((crush) {
      crush['status'] == 'U' ? _crushes.add(crush['m_id']) : null;
    });
    return crushes;
  }
}
