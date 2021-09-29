import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
