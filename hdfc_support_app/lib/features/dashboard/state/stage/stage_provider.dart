import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/app/state/auth_providers.dart';

import 'stage_notifier.dart';
import 'stage_state.dart';
import '../../services/stage_service.dart';

/// Provides StageService instance
final stageServiceProvider = Provider<StageService>((ref) {
  return StageService();
});

/// Global stages state provider
final stageProvider = StateNotifierProvider<StageNotifier, StageState>((ref) {
  final stageService = ref.read(stageServiceProvider);
  final token = ref.read(authProvider).token;
  return StageNotifier(stageService, token);
});
