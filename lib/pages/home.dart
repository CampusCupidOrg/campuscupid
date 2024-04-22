import 'package:campuscupid/components/Crushes.dart';
import 'package:campuscupid/components/Invites.dart';
import 'package:flutter/material.dart';
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
        title: const Center(
            child: const Text(
          'Campus Cupid',
        )),
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
                final pref = await SharedPreferences.getInstance();
                pref.remove('userId');
                Navigator.of(context).pushNamed('/signup');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.06),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Crushes", style: TextStyle(fontSize: 20)),
            Crushes(),
            Text("Invites", style: TextStyle(fontSize: 20)),
            Invites()
          ],
        ),
      ),
    );
  }
}
