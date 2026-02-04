import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/models/journey_model.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/table_components.dart';
import 'package:hdfc_support_app/features/dashboard/state/stage/stage_provider.dart';

Widget journeyTable(List<Journey> journeys, WidgetRef ref) {
  void onJourneyRowTap(Journey journey) {
    // debugPrint('Clicked journey: ${journey.journeyId}');
    ref.read(stageProvider.notifier).fetchStages(journeyId: journey.journeyId);
  }

  return Column(
    children: [
      tableHeader(),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(journeys.length, (index) {
              final journey = journeys[index];
              return tableRow(journey: journey, onTap: onJourneyRowTap);
            }),
          ),
        ),
      ),
    ],
  );
}
