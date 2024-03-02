import 'package:campuscupid/components/userCard.dart';
import 'package:campuscupid/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, String>>? _results;
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.done),
        ),
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            'Campus Cupid',
            style: GoogleFonts.pacifico(
                fontSize: 30, color: Color.fromARGB(221, 58, 58, 58)),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: _onSearchFieldChanged,
                  autocorrect: false,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder())),
            ),
          ),
          Expanded(
            child: (_results ?? []).isNotEmpty
                ? ListView.builder(
                    itemCount: _results!.length,
                    itemBuilder: (context, index) {
                      return UserCard(
                        name: _results![index]['full_name'],
                        imageUrl: _results![index]['avatar_url'],
                        id: _results![index]['id'],
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: _results == null
                        ? Container()
                        : Text("No results for '$_input'")),
          ),
        ]));
  }

  /// Handles user entering text into the search field. We kick off a search for
  /// every letter typed.
  _onSearchFieldChanged(String value) async {
    setState(() {
      _input = value;
      if (value.isEmpty) {
        // null is a sentinal value that allows us more control the UI
        // for a better user experience. instead of showing 'No results for ''",
        // if this is null, it will just show nothing
        _results = null;
      }
    });

    final results = await _searchUsers(value);

    setState(() {
      _results = results;
    });
  }

  Future<List<Map<String, String>>> _searchUsers(String name) async {
    final result = await Supabase.instance.client
        .from('profiles')
        .select('full_name,avatar_url,id')
        .neq('id', supabase.auth.currentUser?.id as String)
        .textSearch('fts', "$name:*");

    final List<Map<String, String>> profiles = [];
    for (var row in result) {
      profiles.add({
        'full_name': row['full_name'] as String,
        'avatar_url': row['avatar_url'] as String,
        'id': row['id'] as String,
      });
    }

    return profiles;
  }
}
