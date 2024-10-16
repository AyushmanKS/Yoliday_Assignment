import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFdf5532),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.filter_list, color: Colors.white),
          SizedBox(width: 5),
          Text(
            'Filter',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
