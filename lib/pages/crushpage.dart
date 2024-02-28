import 'package:campuscupid/components/crushCard.dart';
import 'package:campuscupid/main.dart';
import 'package:campuscupid/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Crush extends StatefulWidget {
  const Crush({super.key});

  @override
  State<Crush> createState() => _CrushState();
}

class _CrushState extends State<Crush> {
  List<Map<String, String>>? _results;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      _getCrushes().then((value) {
        setState(() {
          _results = value;
        });
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
                : const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Text('No Crushes Yet'),
                  ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Search()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Map<String, String>>> _getCrushes() async {
    final response = await supabase
        .from('profiles')
        .select('full_name,avatar_url,id,matches(crush_id)')
        .eq('id', supabase.auth.currentUser!.id);

    List<String> crushes = [];
    for (var row in response[0]['matches']) {
      crushes.add(row['crush_id']);
    }

    final crushProfResponse = await supabase
        .from('profiles')
        .select('full_name,avatar_url,id')
        .inFilter('id', crushes);

    List<Map<String, String>> crushProfs = [];

    for (var row in crushProfResponse) {
      crushProfs.add({
        'full_name': row['full_name'],
        'avatar_url': row['avatar_url'],
        'id': row['id']
      });
    }
    return crushProfs;
  }
}
