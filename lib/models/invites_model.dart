import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvitesData extends ChangeNotifier {
  List<String> _invites = [];

  List<String> get invites => _invites;

  void sendInvite(String name) {
    _invites.add(name);
    notifyListeners();
  }

  void deleteInvite(int index) {
    notifyListeners();
  }

  Future<List<String>> getInvites() async {
    final dio = Dio();
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString('email');
    final response = await dio.get(
        'https://campuscupid.social/api/users/viewmatches/${email?.split('@')[0]}');
    _invites.clear();
    response.data.forEach((crush) {
      crush['status'] == 'I' ? _invites.add(crush['m_id']) : null;
    });
    return invites;
  }
}
