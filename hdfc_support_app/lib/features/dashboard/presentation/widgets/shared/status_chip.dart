import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final status;

  const StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final statusColor;

    final statusShade;

    if (status == "Completed" || status == "Success") {
      statusColor = Colors.green.shade700;
      statusShade = Colors.green.shade50;
    } else if (status == "Failed") {
      statusColor = Colors.red.shade700;
      statusShade = Colors.red.shade50;
    } else {
      statusColor = Colors.purple.shade700;
      statusShade = Colors.purple.shade50;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
