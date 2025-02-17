import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const HomeSearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      hintText: 'Search widgets...',
      leading: const Icon(Icons.search),
    );
  }
} 