import 'package:flutter/material.dart';

Widget emptyState() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Placeholder icon / illustration
          Icon(
            Icons.track_changes_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),

          const Text(
            'Ready to Analyze Logs?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          const Text(
            'Enter Customer ID, Transaction ID, etc. and\n'
            'Select Date Range and Other Filters for precise\n'
            'searching.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
