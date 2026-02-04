import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';

// Widget pagination() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: const [
//       Text('Showing results', style: TextStyle(color: Colors.grey)),
//     ],
//   );
// }

Widget pagination() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Showing 1 to 10 of 100 results.',
        style: TextStyle(color: Colors.grey),
      ),
      Row(
        children: [
          _pageButton('<'),
          _pageButton('1', selected: true),
          _pageButton('2'),
          _pageButton('3'),
          _pageButton('>'),
        ],
      ),
    ],
  );
}

Widget _pageButton(String text, {bool selected = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? const Color(0xff004C8F) : Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Text(
      text,
      style: TextStyle(color: selected ? Colors.white : Colors.black),
    ),
  );
}
