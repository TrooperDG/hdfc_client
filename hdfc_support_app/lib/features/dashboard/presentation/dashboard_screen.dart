import 'package:flutter/material.dart';
import 'package:hdfc_support_app/core/widgets/nav_bar.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/initial_page_widgets/initial_display.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/journey_widgets/journeys_display.dart';
import 'package:hdfc_support_app/core/widgets/footer_placeholder.dart';
import 'package:hdfc_support_app/features/dashboard/presentation/widgets/stage_widgets/stages_display.dart';
import 'package:hdfc_support_app/core/widgets/loading_widget.dart';

//provider-----------
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/journey/journey_provider.dart';
import '../state/stage/stage_provider.dart';
//----------------------

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeyState = ref.watch(journeyProvider);
    final stageState = ref.watch(stageProvider);

    Widget display;
    if (stageState.journeyId.isNotEmpty) {
      display = const StagesDisplay();
    } else {
      display = const JourneysDisplay();
    }
    return Scaffold(
      appBar: NavBar(),
      // backgroundColor: const Color(0xFF394256),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1250),
          child: display,
        ),
      ),

      bottomNavigationBar: const AppPlaceholderFooter(),
    );
  }
}
