import 'package:flutter/material.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/journey_table.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/pagination.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/empty_state.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/error_state.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/loading_state.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/stage_widgets/stage_table.dart';

import 'package:hdfc_support_app/features/dashboard/state/journey/journey_state.dart';
import 'package:hdfc_support_app/features/dashboard/state/stage/stage_state.dart';

Widget tableContainer(StageState stateState) {
  Widget display;
  if (stateState.isLoading) {
    display = loadingState();
  } else if (stateState.errorMessage != null) {
    display = errorState(stateState.errorMessage!);
  } else if (stateState.stages.isEmpty) {
    display = emptyState();
  } else {
    display = stageTable(stateState.stages);
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
