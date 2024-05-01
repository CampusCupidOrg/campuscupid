import 'package:campuscupid/components/InviteCard.dart';
import 'package:campuscupid/models/invites_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Invites extends StatefulWidget {
  const Invites({super.key});

  @override
  State<Invites> createState() => _InvitesState();
}

class _InvitesState extends State<Invites> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<InvitesData>(
      builder: (context, value, child) {
        return ReorderableListView.builder(
            proxyDecorator: (child, index, animation) => Material(
                  color: Colors.transparent,
                  child: Card(
                    child: Center(
                      child: Text(
                        value.invites[index],
                        style: TextStyle(fontSize: size.height * 0.04),
                      ),
                    ),
                  ),
                ),
            shrinkWrap: true,
            itemCount: value.invites.length,
            itemBuilder: (context, index) {
              return InviteCard(
                key: Key('$index'),
                name: value.invites[index],
              );
            },
            onReorder: (oldRank, newRank) {});
      },
    );
  }
}
