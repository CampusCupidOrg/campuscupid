import 'package:campuscupid/components/userCard.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, String>>? _results;
  String _input = '';
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
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
                      imageUrl: _results![index]['avatar_url']);
                },
              )
            : Padding(
                padding: const EdgeInsets.only(top: 200),
                child: _results == null
                    ? Container()
                    : Text("No results for '$_input'")),
      )
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
      _expand = true;
    });
  }

  Future<List<Map<String, String>>> _searchUsers(String name) async {
    final result = await Supabase.instance.client
        .from('profiles')
        .select('full_name,avatar_url')
        .textSearch('fts', "$name:*");

    final List<Map<String, String>> profiles = [];
    for (var row in result) {
      profiles.add({
        'full_name': row['full_name'] as String,
        'avatar_url': row['avatar_url'] as String,
      });
    }

    return profiles;
  }
}
