import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends StatelessWidget {
  final String token;

  const Verify({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final pref = await SharedPreferences.getInstance();
            pref.setString('token', token);
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: const Text('You have been logged in successfully!'),
        ),
      ),
    );
  }
}
