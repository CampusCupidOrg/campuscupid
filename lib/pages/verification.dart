import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends StatelessWidget {
  final String token;
  const Verify({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('You have been logged in successfully!'),
            TextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.setString('token', token);
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              child: const Text('Click here to continue'),
            ),
          ],
        ),
      ),
    );
  }
}
