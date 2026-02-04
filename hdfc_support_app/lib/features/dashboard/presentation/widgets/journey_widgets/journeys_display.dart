import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/header.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/journey_search_bar.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/table_container.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';
// import 'package:hdfc_support_app/features/dashboard/state/stage/stage_provider.dart';

class JourneysDisplay extends ConsumerWidget {
  const JourneysDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeyState = ref.watch(journeyProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF6F8FB),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header("Journeys", "Search and monitor customer journeys."),
            const SizedBox(height: 20),
            journeySearchBar(ref),
            const SizedBox(height: 20),

            /// TABLE + STATES
            Expanded(child: tableContainer(journeyState, ref)),
          ],
        ),
      ),
    );
  }
}
