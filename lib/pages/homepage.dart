import 'package:campuscupid/pages/accountpage.dart';
import 'package:campuscupid/pages/crushpage.dart';
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
      body: SafeArea(
          child: <Widget>[
        const Crush(),
        const AccountPage()
      ][currentPageIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.pink[100],
        onDestinationSelected: (int index) {
          // Respond to item tap
          if (mounted) {
            setState(() {
              currentPageIndex = index;
            });
          }
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Crush List',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_sharp),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Search()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
