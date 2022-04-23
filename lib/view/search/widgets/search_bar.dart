import 'package:flutter/material.dart';

import 'package:marvel_guide/core/app_colors.dart';

import '../../../utils/debouncer.dart';

class SearchBar extends StatelessWidget {
  final Function(String) searchFn;

  const SearchBar({
    Key? key,
    required this.searchFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 1000);

    return TextField(
      onChanged: (value) {
        _debouncer.run(() {
          searchFn(value);
        });
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.white60,
        ),
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        hintText: 'Ex: Spider',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
