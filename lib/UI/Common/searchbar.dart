import 'package:flutter/material.dart';

typedef StringCallback = void Function(String);

// TODO: Implementare search bar custom
class SearchBar extends StatelessWidget {
  final StringCallback onTextChanged;
  final StringCallback? onTextSubmitted;

  const SearchBar(
      {super.key, required this.onTextChanged, this.onTextSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
          decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search)),
          onChanged: ((value) => onTextChanged(value)),
      ),
    );
  }
}
