import 'dart:developer' as dev;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'stage_state.dart';
import '../../models/stage_model.dart';
import '../../services/stage_service.dart';
// import '../../../models/stage_search_result.dart';

class StageNotifier extends StateNotifier<StageState> {
  final StageService _stageService;
  final String _token;

  StageNotifier(this._stageService, this._token) : super(StageState.initial());

  /// Fetch stages for a journey (first load or refresh)
  Future<void> fetchStages({
    required String journeyId,
    int page = 1,
    int pageSize = 10,
    String order = 'desc',
    List filters = const [],
  }) async {
    // Reset state if journey changes
    if (state.journeyId != journeyId) {
      state = StageState.initial().setStagesState(
        journeyId: journeyId,
        order: order,
        filters: filters,
        isLoading: true,
        errorMessage: null,
      );
    } else {
      state = state.setStagesState(isLoading: true, errorMessage: null);
    }

    try {
      final StageSearchResult result = await _stageService.fetchStages(
        journeyId: journeyId,
        token: _token,
        page: page,
        pageSize: pageSize,
        order: order,
        filters: filters,
      );

      // state = state.setStagesState(
      //   stages: result.stages,
      //   page: page,
      //   pageSize: pageSize,
      //   pageCount: result.pageCount,
      //   isLoading: false,
      // );

      final List<Stage> updatedStages = page == 1
          ? result.stages
          : [...state.stages, ...result.stages];

      state = state.setStagesState(
        stages: updatedStages,
        page: page,
        pageSize: pageSize,
        pageCount: result.pageCount,
        order: order,
        filters: filters,
        isLoading: false,
      );
    } catch (e) {
      state = state.setStagesState(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Load next page if available
  Future<void> fetchNextPage() async {
    if (state.isLoading || !state.hasNextPage) return;

    await fetchStages(
      journeyId: state.journeyId,
      page: state.page + 1,
      pageSize: state.pageSize,
      order: state.order,
      filters: state.filters,
    );
  }

  void reset() {
    state = StageState.initial();
  }
}
