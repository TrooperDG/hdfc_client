import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';

Widget journeySearchBar(WidgetRef ref) {
  final controller = TextEditingController();

  return Row(
    children: [
      SizedBox(
        width: 320,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter Customer ID',
            prefixIcon: Icon(Icons.search),
            // border: OutlineInputBorder(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      const SizedBox(width: 10),

      ElevatedButton(
        onPressed: () {
          final customerId = controller.text.trim();
          if (customerId.isEmpty) return;

          ref
              .read(journeyProvider.notifier)
              .fetchJourneys(customerId: customerId);

          controller.clear();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff004C8F),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Icon(Icons.search, color: Colors.white),
      ),

      const SizedBox(width: 10),
      _inputField(hint: 'Last Date', icon: Icons.calendar_today),
      const SizedBox(width: 10),
      _inputField(hint: 'Time', icon: Icons.access_time),
      const SizedBox(width: 10),
      _inputField(hint: 'Filters', icon: Icons.filter_alt_outlined),
      const SizedBox(width: 10),
      ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.filter_list, color: Colors.white),
        label: const Text(
          'Apply Filters',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff004C8F),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 👈 change radius here
          ),
        ),
      ),
      const SizedBox(width: 10),
      // TextButton(onPressed: () {}, child: const Text('Reset')),
      const SizedBox(width: 10),
      TextButton(
        onPressed: () {},
        child: const Text(
          'Refresh',
          style: TextStyle(color: const Color(0xff004C8F)),
        ),
      ),
    ],
  );
}

Widget _inputField({
  required String hint,
  required IconData icon,
  double width = 160,
}) {
  return SizedBox(
    width: width,
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 18),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
