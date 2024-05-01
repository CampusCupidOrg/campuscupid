import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends StatelessWidget {
  final String token;
  const Verify({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have been logged in successfully!'),
            TextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                final dio = Dio();
                pref.setString('token', token);
                Response response = await dio
                    .get('https://campuscupid.social/api/users/login/$token');
                pref.setString('email', response.data['payload'].toString());
                context.go('/home');
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
