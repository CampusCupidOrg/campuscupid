import 'package:flutter/material.dart';

class InvitesData extends ChangeNotifier {
  List<String> _invites = ['Sneha', 'Rekha', 'Geeta', 'Seeta', 'Meeta'];

  List<String> get invites => _invites;

  void sendInvite(String name) {
    _invites.add(name);
    notifyListeners();
  }

  // List<String> getCrushes() {
  //   return crushes;
  // }
}
