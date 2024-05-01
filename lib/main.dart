import 'package:campuscupid/screens/about.dart';
import 'package:campuscupid/screens/home.dart';
import 'package:campuscupid/screens/signup.dart';
import 'package:campuscupid/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

GoRouter _appRoute = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          final pref = snapshot.data;
          String? email = pref?.getString('email');
          if (snapshot.hasData) {
            return email != null ? const Home() : const Signup();
          } else {
            return const Signup();
          }
        },
      );
    },
  ),
  GoRoute(
    path: '/api/users/login/:token',
    builder: (BuildContext context, GoRouterState state) {
      String? token = state.pathParameters['token'];
      return Verify(
        token: token!,
      );
    },
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const Signup(),
  ),
  GoRoute(
    path: '/result',
    builder: (context, state) => const Result(),
  ),
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const Home();
    },
  ),
  GoRoute(
    path: '/about',
    builder: (BuildContext context, GoRouterState state) {
      return const About();
    },
  ),
]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Campus Cupid',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routerConfig: _appRoute,
    );
  }
}
