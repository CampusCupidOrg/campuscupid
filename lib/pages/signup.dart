import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
              String email = _emailController.text;
              RegExp regex =
                  RegExp(r'^[a-zA-Z0-9]+[._]?[a-zA-Z0-9]+@srmist\.edu\.in$');
              if (!regex.hasMatch(email)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Invalid email. Please enter a valid SRMIST email."),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                Dio dio = Dio();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please verify your email"),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
