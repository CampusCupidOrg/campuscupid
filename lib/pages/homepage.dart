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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        leading: null,
        elevation: 0.0,
        toolbarHeight: size.height * 0.1,
        title: Text(
          'Campus Cupid',
          style: GoogleFonts.pacifico(
              fontSize: size.width * 0.12,
              color: const Color.fromARGB(221, 58, 58, 58)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          minimum: EdgeInsets.all(size.width * 0.05),
          child: <Widget>[
            const Crush(),
            const AccountPage()
          ][currentPageIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.pink[100],
        animationDuration: const Duration(seconds: 1),
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
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Search()));
        },
        backgroundColor: Colors.red[400],
        child: const Icon(
          Icons.food_bank_sharp,
          color: Colors.black87,
        ),
      ),
    );
  }
}
