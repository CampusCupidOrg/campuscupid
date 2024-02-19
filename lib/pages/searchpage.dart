import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String>? _results;
  String _input = '';

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
      const SizedBox(
        height: 200,
      ),
      Expanded(
        child: (_results ?? []).isNotEmpty
            ? ListView.builder(
                itemCount: _results!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_results![index]),
                  );
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
    });
  }

  Future<List<String>> _searchUsers(String name) async {
    final result = await Supabase.instance.client
        .from('profiles')
        .select('full_name')
        .textSearch('fts', "$name:*");

    final List<String> names = [];
    for (var row in result) {
      names.add(row['full_name'] as String);
    }

    return names;
  }
}
