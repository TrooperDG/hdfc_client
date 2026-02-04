import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';

Widget errorState(errMessage) {
  return const Center(
    child: Text('Failed to load journeys', style: TextStyle(color: Colors.red)),
  );
}
