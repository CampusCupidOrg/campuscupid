import 'package:campuscupid/pages/homepage.dart';
import 'package:campuscupid/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://zyzgxcijsrmscoxcnqud.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp5emd4Y2lqc3Jtc2NveGNucXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2NjkwMjEsImV4cCI6MjAyMzI0NTAyMX0.6AYeETjZOZFIYJBRfNU31PYo2KVezgg3o8RRaQ__gHg',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Cupid',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
