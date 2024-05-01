import 'package:campuscupid/components/Crushes.dart';
import 'package:campuscupid/components/Invites.dart';
import 'package:campuscupid/models/crushes_model.dart';
import 'package:campuscupid/models/invites_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Text(
              style: TextStyle(
                fontSize: size.height * 0.04,
              ),
              'Campus Cupid',
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        width: size.width * 0.4,
        child: ListView(
          children: <Widget>[
            Container(
                height: size.height * 0.08,
                color: Colors.pink,
                child: const DrawerHeader(
                  child: Text('Settings'),
                )),
            ListTile(
              title: const Text('Invites'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Crushes'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                // final pref = await SharedPreferences.getInstance();
                // pref.remove('userId');
                context.go('/signup');
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.06),
          child: Column(
            children: [
              Text(
                "Crushes",
                style: TextStyle(fontSize: size.height * 0.04),
              ),
              ChangeNotifierProvider(
                  create: (context) => CrushesData(), child: const Crushes()),
              Text(
                "Invites",
                style: TextStyle(fontSize: size.height * 0.04),
              ),
              ChangeNotifierProvider(
                  create: (context) => InvitesData(), child: const Invites()),
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Text(
              style: TextStyle(
                fontSize: size.height * 0.04,
              ),
              'Campus Cupid',
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        width: size.width * 0.4,
        child: ListView(
          children: <Widget>[
            Container(
                height: size.height * 0.08,
                color: Colors.pink,
                child: const DrawerHeader(
                  child: Text('Settings'),
                )),
            ListTile(
              title: const Text('Invites'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Crushes'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                // final pref = await SharedPreferences.getInstance();
                // pref.remove('userId');
                // Navigator.pushReplacementNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You have a crush on",
              style: TextStyle(fontSize: size.height * 0.04),
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: size.height * 0.04),
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: size.height * 0.04),
            ),
            Text(
              "Phone",
              style: TextStyle(fontSize: size.height * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
