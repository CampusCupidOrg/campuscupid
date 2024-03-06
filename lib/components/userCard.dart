import 'dart:convert';

import 'package:campuscupid/main.dart';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

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
  Future<void> _addCrush() async {
    final curr_user = utf8.encode(supabase.auth.currentUser!.id);
    final crush = utf8.encode(widget.id!);
    var output = AccumulatorSink<Digest>();
    var input = sha256.startChunkedConversion(output);
    input.add(curr_user);
    input.add(crush);
    input.close();
    var digest = output.events.single;
    final send = {
      'user_id': supabase.auth.currentUser!.id,
      'crush_id': widget.id,
      'match_hash': digest.toString()
    };

    // Upload send object to Supabase table called 'matches'
    final response = await supabase.from('matches').upsert([send]);
    print(response);
  }

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
            onPressed: _addCrush,
          ),
        ),
      ),
    );
  }
}
