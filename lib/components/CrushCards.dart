import 'package:campuscupid/models/crushes_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    Size size = MediaQuery.of(context).size;
    return Consumer<crushesData>(
      builder: (context, value, child) {
        return Card(
          margin: const EdgeInsets.all(8),
          elevation: 4,
          // color: widget.available ? Colors.green : Colors.yellow,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: size.height * 0.04,
              top: size.height * 0.04,
              left: size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.rank.toString(),
                  style: TextStyle(fontSize: size.height * 0.04),
                ),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.height * 0.04),
                ),
                ElevatedButton(
                  onPressed: () {
                    final crushActions = context.read<crushesData>();
                    crushActions.deleteCrush(widget.rank - 1);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, elevation: 0),
                  child: Icon(Icons.cancel_outlined),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
