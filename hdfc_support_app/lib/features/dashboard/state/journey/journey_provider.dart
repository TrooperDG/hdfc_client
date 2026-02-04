import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/app/state/auth_providers.dart';

import 'journey_notifier.dart';
import 'journey_state.dart';
import 'package:hdfc_support_app/features/dashboard/services/journey_service.dart';

/// Provides JourneyService instance
final journeyServiceProvider = Provider<JourneyService>((ref) {
  return JourneyService();
});

/// Global journeys state provider
final journeyProvider = StateNotifierProvider<JourneyNotifier, JourneyState>((
  ref,
) {
  final journeyService = ref.read(journeyServiceProvider);
  final token = ref.read(authProvider).token;
  return JourneyNotifier(journeyService, token);
});
