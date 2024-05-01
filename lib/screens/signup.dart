import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Campus Cupid',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Signup'),
            onPressed: () async {
              String email = _emailController.text;
              RegExp regex =
                  // RegExp(r'^[a-zA-Z0-9]+[._]?[a-zA-Z0-9]+@srmist\.edu\.in$');
                  RegExp(
                      r'^[a-zA-Z0-9]+[._]?[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
              if (regex.hasMatch(email)) {
                final dio = Dio();
                await dio.get(
                    'https://campuscupid.social/api/users/sendmagiclink/$email');
                FloatingSnackBar(
                  message: 'Please verify your email',
                  context: context,
                  backgroundColor: Colors.greenAccent,
                  textStyle: const TextStyle(color: Colors.orange),
                  duration: const Duration(milliseconds: 4000),
                );
              } else {
                FloatingSnackBar(
                  message: "Invalid email. Please enter a valid SRMIST email.",
                  context: context,
                  backgroundColor: Colors.pink,
                  textStyle: const TextStyle(color: Colors.yellowAccent),
                  duration: const Duration(milliseconds: 2000),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
