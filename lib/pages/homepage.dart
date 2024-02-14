import 'package:campuscupid/main.dart';
import 'package:campuscupid/pages/accountpage.dart';
import 'package:campuscupid/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Campus Cupid',
          style: GoogleFonts.pacifico(
              fontSize: 30, color: Color.fromARGB(221, 58, 58, 58)),
        ),
        centerTitle: true,
      ),
      body: <Widget>[const Search(), const AccountPage()][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          // Respond to item tap
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Crush List',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    );
  }
}
