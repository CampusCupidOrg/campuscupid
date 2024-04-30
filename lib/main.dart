import 'package:campuscupid/pages/home.dart';
import 'package:campuscupid/pages/signup.dart';
import 'package:campuscupid/pages/verification.dart';
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
      return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            final pref = snapshot.data!;
            if (pref.getString('token') == true) {
              if (false) {
                return const Result();
              }
              return const Home();
            } else {
              return const Signup();
            }
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
