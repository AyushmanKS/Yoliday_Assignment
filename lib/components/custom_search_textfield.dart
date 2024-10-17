import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearchTextField({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Select a project',
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFd6d1d5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFd6d1d5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFd6d1d5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFd6d1d5),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4, top: 4, bottom: 4),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xFFdf5532),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(
              'assets/images/icons/ic_baseline-search.svg',
              width: 14,
              height: 14,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      onChanged: onSearch, // Call the callback whenever the input changes
    );
  }
}
