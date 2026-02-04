import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdfc_support_app/features/dashboard/models/journey_model.dart';
import 'package:hdfc_support_app/features/dashboard/services/journey_service.dart';

import 'journey_state.dart';

class JourneyNotifier extends StateNotifier<JourneyState> {
  final JourneyService _journeyService;
  final String _token;

  JourneyNotifier(this._journeyService, this._token)
    : super(JourneyState.initial());

  Future<void> fetchJourneys({
    required String customerId,
    int page = 1,
    int pageSize = 10,
    String order = 'desc',
    List<dynamic> filters = const [],
  }) async {
    // Reset state if customer changes
    if (state.customerId != customerId) {
      state = JourneyState.initial().setJourneysState(
        customerId: customerId,
        order: order,
        filters: filters,
        isLoading: true,
        errorMessage: null,
      );
    } else {
      state = state.setJourneysState(isLoading: true, errorMessage: null);
    }

    try {
      final JourneySearchResult result = await _journeyService.fetchJourneys(
        customerId: customerId,
        token: _token,
        page: page,
        pageSize: pageSize,
        order: order,
        filters: filters,
      );

      final List<Journey> updatedJourneys = page == 1
          ? result.journeys
          : [...state.journeys, ...result.journeys];

      state = state.setJourneysState(
        journeys: updatedJourneys,
        page: page,
        pageSize: pageSize,
        pageCount: result.pageCount,
        order: order,
        filters: filters,
        isLoading: false,
      );
    } catch (e) {
      state = state.setJourneysState(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading || !state.hasNextPage) return;

    await fetchJourneys(
      customerId: state.customerId,
      page: state.page + 1,
      pageSize: state.pageSize,
      order: state.order,
      filters: state.filters,
    );
  }

  void reset() {
    state = JourneyState.initial();
  }
}
