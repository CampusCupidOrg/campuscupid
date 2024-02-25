import 'package:flutter/material.dart';

class CrushCard extends StatefulWidget {
  final String? name;
  final String? imageUrl;
  final String? id;

  CrushCard(
      {Key? key, required this.name, required this.imageUrl, required this.id})
      : super(key: key);

  @override
  State<CrushCard> createState() => _CrushCardState();
}

class _CrushCardState extends State<CrushCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl ?? '')),
          title: Text(widget.name ?? ''),
        ),
      ),
    );
  }
}
