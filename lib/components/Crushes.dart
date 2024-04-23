import 'package:campuscupid/components/CrushCards.dart';
import 'package:campuscupid/models/crushes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Crushes extends StatefulWidget {
  const Crushes({Key? key});

  @override
  State<Crushes> createState() => CrushesState();
}

class CrushesState extends State<Crushes> {
  // List<String> crushes = [
  //   'Pusha',
  //   'Shipla',
  //   'Amdhu',
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<crushesData>(builder: (context, value, child) {
      return ReorderableListView.builder(
        proxyDecorator: (child, index, animation) => Material(
          color: Colors.transparent,
          child: Card(
            child: Center(
              child: Text(
                value.crushes[index],
                style: TextStyle(fontSize: size.height * 0.04),
              ),
            ),
          ),
        ),
        shrinkWrap: true,
        itemCount: value.crushes.length,
        itemBuilder: (context, index) {
          return CrushCard(
            key: Key('$index'),
            name: value.crushes[index],
            rank: index + 1,
            available: true,
          );
        },
        onReorder: (oldRank, newRank) {
          setState(() {
            if (newRank > oldRank) {
              newRank -= 1;
            }
            final item = value.crushes.removeAt(oldRank);
            value.crushes.insert(newRank, item);
          });
        },
      );
    });
  }
}
