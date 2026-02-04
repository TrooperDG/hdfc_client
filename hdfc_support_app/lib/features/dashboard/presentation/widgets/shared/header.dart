import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget header(String name, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      SizedBox(height: 6),
      Text(text, style: TextStyle(color: Colors.grey)),
    ],
  );
}
