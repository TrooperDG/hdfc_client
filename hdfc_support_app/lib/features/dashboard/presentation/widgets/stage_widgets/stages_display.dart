import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/shared/header.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/stage_widgets/stage_search_bar.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/stage_widgets/table_container.dart';
import 'package:hdfc_support_app/features/dashboard/state/journey/journey_provider.dart';
import 'package:hdfc_support_app/features/dashboard/state/stage/stage_provider.dart';

class StagesDisplay extends ConsumerWidget {
  const StagesDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageState = ref.watch(stageProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF6F8FB),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(
                  onPressed: () {
                    ref.read(stageProvider.notifier).reset();
                  },
                ),
                header("Stages", "Search and monitor journey stages"),
              ],
            ),

            const SizedBox(height: 20),
            stageSearchBar(ref),
            const SizedBox(height: 20),

            /// TABLE + STATES
            Expanded(child: tableContainer(stageState)),
          ],
        ),
      ),
    );
  }
}
