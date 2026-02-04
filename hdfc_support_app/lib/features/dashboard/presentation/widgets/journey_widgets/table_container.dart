import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/journey_table.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/pagination.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/empty_state.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/error_state.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/loading_state.dart';
// import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/states.dart';

import 'package:hdfc_support_app/features/dashboard/state/journey/journey_state.dart';

Widget tableContainer(JourneyState journeyState, WidgetRef ref) {
  Widget display;
  if (journeyState.isLoading) {
    display = loadingState();
  } else if (journeyState.errorMessage != null) {
    display = errorState(journeyState.errorMessage!);
  } else if (journeyState.journeys.isEmpty) {
    // display = emptyState();
    display = emptyState();
  } else {
    display = journeyTable(journeyState.journeys, ref);
  }

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      children: [
        Expanded(child: display),
        Divider(height: 1, color: Colors.grey.shade300),
        Padding(
          padding: const EdgeInsets.all(12),
          child: pagination(), // UI only
        ),
      ],
    ),
  );
}
