import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/models/journey_model.dart';
import 'package:hdfc_support_app/features/dashboard/models/stage_model.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/stage_widgets/stage_table_components.dart';

Widget stageTable(List<Stage> stages) {
  void onStageRowTap(Stage stage) {
    debugPrint('Clicked Stage: ${stage.transactionId}');
    // later:
    // navigate to details page
    // open dialog
    // call another API
  }

  return Column(
    children: [
      tableHeader(),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(stages.length, (index) {
              final stage = stages[index];
              return tableRow(stage: stage, onTap: onStageRowTap);
            }),
          ),
        ),
      ),
    ],
  );
}
