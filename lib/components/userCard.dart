import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String? name;
  final String? imageUrl;
  final String? id;

  UserCard(
      {Key? key, required this.name, required this.imageUrl, required this.id})
      : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
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
              icon: Icon(Icons.add),
              onPressed: () {
                print('Add ${widget.id}');
              }),
        ),
      ),
    );
  }
}
