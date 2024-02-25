import 'package:campuscupid/components/crushCard.dart';
import 'package:campuscupid/main.dart';
import 'package:campuscupid/pages/searchpage.dart';
import 'package:flutter/material.dart';

class Crush extends StatefulWidget {
  const Crush({super.key});

  @override
  State<Crush> createState() => _CrushState();
}

class _CrushState extends State<Crush> {
  List<Map<String, String>>? _results;
  @override
  void initState() {
    // TODO: implement initState
    _getCrushes().then((value) {
      setState(() {
        _results = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: (_results ?? []).isNotEmpty
                ? ListView.builder(
                    itemCount: _results!.length,
                    itemBuilder: (context, index) {
                      return CrushCard(
                        name: _results![index]['full_name'],
                        imageUrl: _results![index]['avatar_url'],
                        id: _results![index]['id'],
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: const Text('No Crushes Yet'),
                  ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Search()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Map<String, String>>> _getCrushes() async {
    // TODO: Get crushes from Supabase
    return [];
  }
}
