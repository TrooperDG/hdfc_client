import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/models/journey_model.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';

Widget tableHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
    ),
    child: _tableRowLayout(
      isHeader: true,
      values: const ['JOURNEY ID', 'JOURNEY NAME', 'STATUS'],
    ),
  );
}

Widget tableRow({
  required Journey journey,
  required void Function(Journey) onTap,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Material(
      color: Colors.white,
      child: InkWell(
        hoverColor: Color.fromARGB(58, 2, 117, 217),
        // splashColor: Colors.red,
        highlightColor: Color.fromARGB(107, 2, 117, 217),

        onTap: () => onTap(journey),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: _tableRowLayout(
            values: [
              journey.journeyId,
              journey.journeyName,
              journey.journeyStatus,
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _tableRowLayout({required List<String> values, bool isHeader = false}) {
  final style = TextStyle(
    fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
    color: isHeader ? Colors.black87 : Colors.black54,
    fontSize: 13,
  );

  return Row(
    children: values.map((text) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(text, style: style, overflow: TextOverflow.ellipsis),
        ),
      );
    }).toList(),
  );
}
