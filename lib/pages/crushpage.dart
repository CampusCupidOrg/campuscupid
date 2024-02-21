import 'package:campuscupid/pages/searchpage.dart';
import 'package:flutter/material.dart';

class Crush extends StatefulWidget {
  const Crush({super.key});

  @override
  State<Crush> createState() => _CrushState();
}

class _CrushState extends State<Crush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Search()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
