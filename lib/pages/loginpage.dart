import 'dart:async';
import 'package:campuscupid/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (_emailController.text.isEmpty ||
          !_emailController.text.trim().endsWith('@srmist.edu.in')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Enter you SRM email'),
            backgroundColor: Colors.red[400],
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        await supabase.auth.signInWithOtp(
          email: _emailController.text.trim(),
          emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/',
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Check your email for a login link!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
          _emailController.clear();
        }
      }
    } on AuthException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;

        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        minimum: EdgeInsets.all(size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Campus Cupid",
                style: GoogleFonts.pacifico(
                    fontSize: size.width * 0.19,
                    color: const Color.fromARGB(221, 27, 27, 27)),
              ),
              SizedBox(height: size.height * 0.14),
              Text(
                "Sign Up",
                style: GoogleFonts.pacifico(
                    fontSize: size.width * 0.14,
                    color: const Color.fromARGB(221, 27, 27, 27)),
              ),
              SizedBox(height: size.height * 0.04),
              Icon(Icons.heart_broken_sharp, size: 100, color: Colors.red[900]),
              SizedBox(height: size.height * 0.04),
              Text(
                'Sign in via the magic link with your email below',
                style: TextStyle(fontSize: size.height * 0.02),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.06),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.red[600]),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          )),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      )),
                  style: TextStyle(color: Colors.red[600]),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ElevatedButton(
                onPressed: _isLoading ? null : _signIn,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.pink[100],
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.red[900]),
                ),
                child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
