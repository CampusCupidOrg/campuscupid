import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        body: Center(
      child: Column(
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
              Navigator.pushReplacementNamed(context, '/home');
              final pref = await SharedPreferences.getInstance();
              final userId = _emailController.text.split('@')[0];
              pref.setString('userId', userId);
            },
          ),
        ],
      ),
    ));
  }
}
