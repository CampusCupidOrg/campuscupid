import 'package:campuscupid/components/CrushCards.dart';
import 'package:flutter/material.dart';

class Crushes extends StatefulWidget {
  const Crushes({Key? key});

  @override
  State<Crushes> createState() => CrushesState();
}

class CrushesState extends State<Crushes> {
  List<String> crushes = [
    'Pusha',
    'Shipla',
    'Amdhu',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReorderableListView.builder(
        shrinkWrap: true,
        itemCount: crushes.length,
        itemBuilder: (context, index) {
          return CrushCard(
            key: Key('$index'),
            name: crushes[index],
            rank: index + 1,
            color: 'red',
          );
        },
        onReorder: (oldRank, newRank) {
          setState(() {
            if (newRank > oldRank) {
              newRank -= 1;
            }
            final item = crushes.removeAt(oldRank);
            crushes.insert(newRank, item);
          });
        },
      ),
    );
  }
}
