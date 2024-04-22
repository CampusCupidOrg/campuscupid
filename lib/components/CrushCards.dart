import 'package:flutter/material.dart';

class CrushCard extends StatefulWidget {
  final String name;
  final int rank;
  final String color;

  const CrushCard(
      {Key? key, required this.name, required this.rank, required this.color})
      : super(key: key);

  @override
  State<CrushCard> createState() => _CrushCardState();
}

class _CrushCardState extends State<CrushCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: ListTile(
        title: Text(widget.name),
        subtitle: Text('Rank: ${widget.rank}'),
      ),
    );
  }
}
