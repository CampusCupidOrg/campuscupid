import 'package:campuscupid/pages/accountpage.dart';
import 'package:campuscupid/pages/homepage.dart';
import 'package:campuscupid/pages/loginpage.dart';
import 'package:campuscupid/pages/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://acfuijkrswtblunfqcas.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFjZnVpamtyc3d0Ymx1bmZxY2FzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyODM2MTksImV4cCI6MjAyMjg1OTYxOX0.oXKvUps7u8jvn1XtabH1YnV2IPTvL46NGUbPYUNH4RI',
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
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(), // Add this line
        '/account': (context) => const AccountPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage()
      },
    );
  }
}
