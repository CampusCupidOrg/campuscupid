import 'package:campuscupid/pages/home.dart';
import 'package:campuscupid/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Cupid',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Signup(),
      routes: {
        '/home': (context) => const Home(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}
