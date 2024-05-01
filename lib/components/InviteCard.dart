import 'package:campuscupid/models/invites_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InviteCard extends StatefulWidget {
  final String name;

  const InviteCard({super.key, required this.name});

  @override
  State<InviteCard> createState() => InviteState();
}

class InviteState extends State<InviteCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<InvitesData>(
      builder: (context, value, child) {
        return Card(
          margin: const EdgeInsets.all(8),
          elevation: 4,
          shadowColor: Colors.pinkAccent,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: size.height * 0.04,
              top: size.height * 0.04,
              left: size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: size.height * 0.04),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
