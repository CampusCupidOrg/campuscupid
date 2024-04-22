import 'package:flutter/material.dart';

class CrushCard extends StatefulWidget {
  final String name;
  final int rank;
  final bool available;

  const CrushCard(
      {Key? key,
      required this.name,
      required this.rank,
      required this.available})
      : super(key: key);

  @override
  State<CrushCard> createState() => _CrushCardState();
}

class _CrushCardState extends State<CrushCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      color: widget.available ? Colors.green : Colors.yellow,
      child: ListTile(
        title: Text(widget.name),
        subtitle: Text('Rank: ${widget.rank}'),
      ),
    );
  }
}
