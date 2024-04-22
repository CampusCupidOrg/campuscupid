import 'package:campuscupid/components/CrushCards.dart';
import 'package:flutter/material.dart';

class Invites extends StatefulWidget {
  const Invites({super.key});

  @override
  State<Invites> createState() => _InvitesState();
}

class _InvitesState extends State<Invites> {
  List<String> crushes = [
    'Shreya',
    'Shivani',
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
