import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String? name;
  final String? imageUrl;

  UserCard({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl ?? '')),
        title: Text(widget.name ?? ''),
        onTap: () {
          print(widget.name);
        },
      ),
    );
  }
}
