import 'package:campuscupid/components/Crushes.dart';
import 'package:campuscupid/components/Invites.dart';
import 'package:campuscupid/models/crushes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  child: const Text('Settings'),
                )),
            ListTile(
              title: const Text('Invites'),
              onTap: () {
                Navigator.of(context).pushNamed('/invites');
              },
            ),
            ListTile(
              title: const Text('Crushes'),
              onTap: () {
                Navigator.of(context).pushNamed('/crushes');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                // final pref = await SharedPreferences.getInstance();
                // pref.remove('userId');
                Navigator.pushReplacementNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Crushes",
                style: TextStyle(fontSize: size.height * 0.04),
              ),
              ChangeNotifierProvider(
                  create: (context) => crushesData(), child: Crushes()),
              // Text(
              //   "Invites",
              //   style: TextStyle(fontSize: size.height * 0.04),
              // ),
              // Invites()
            ],
          ),
        ),
      ),
    );
  }
}
