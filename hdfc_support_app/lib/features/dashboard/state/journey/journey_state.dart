import '../../models/journey_model.dart';

class JourneyState {
  final String customerId;
  final List<Journey> journeys;

  final int page;
  final int pageSize;
  final int pageCount;
  final String order;
  final List filters; //! need to change the type

  final bool isLoading;
  final String? errorMessage;

  const JourneyState({
    required this.customerId,
    required this.journeys,
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.isLoading,
    required this.errorMessage,
    required this.order,
    required this.filters,
  });

  /// Initial empty state
  factory JourneyState.initial() {
    return const JourneyState(
      customerId: '',
      journeys: [],
      page: 1,
      pageSize: 10,
      pageCount: 0,
      isLoading: false,
      errorMessage: null,
      order: 'desc',
      filters: [],
    );
  }

  /// Derived helper (NOT stored)
  bool get hasNextPage => page < pageCount;

  /// Immutable update helper
  JourneyState setJourneysState({
    String? customerId,
    List<Journey>? journeys,
    int? page,
    int? pageSize,
    int? pageCount,
    bool? isLoading,
    String? errorMessage,
    String? order,
    List? filters,
  }) {
    return JourneyState(
      customerId: customerId ?? this.customerId,
      journeys: journeys ?? this.journeys,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      pageCount: pageCount ?? this.pageCount,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      order: order ?? "desc",
      filters: filters ?? [],
    );
  }
}
