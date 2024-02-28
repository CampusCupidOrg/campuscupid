import 'package:campuscupid/main.dart';
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
          trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _deleteCrush(widget.id!);
              }),
        ),
      ),
    );
  }
}

void _deleteCrush(String crush_id) async {
  final response = await supabase
      .from('matches')
      .delete()
      .eq('crush_id', crush_id)
      .eq('user_id', supabase.auth.currentUser!.id);

  print(response);
}
