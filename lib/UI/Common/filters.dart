import 'package:flutter/material.dart';

class Filters extends StatelessWidget {

  const Filters({super.key, required this.filters, required this.selectedFilterIndex, required this.filter});

  final List<String> filters;
  final int? selectedFilterIndex;
  final Function(String filter, int selectedIndex) filter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (filters.isNotEmpty) ? 40 : 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              return TextButton(
                style: ButtonStyle(
                    backgroundColor: selectedFilterIndex == index
                        ? WidgetStateProperty.all(Colors.deepPurple)
                        : WidgetStateProperty.all(Colors.transparent),
                    foregroundColor: selectedFilterIndex == index
                        ? WidgetStateProperty.all<Color>(Colors.white)
                        : WidgetStateProperty.all<Color>(
                        Colors.deepPurple)),
                onPressed: () {
                  filter(filters[index], index);
                },
                child: Text(filters[index]),
              );
            }),
      ),
    );
  }
}