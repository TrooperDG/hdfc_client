import '../../models/stage_model.dart';

class StageState {
  final String journeyId;
  final List<Stage> stages;

  final int page;
  final int pageSize;
  final int pageCount;
  final String order;
  final List filters; //! need to change the type

  final bool isLoading;
  final String? errorMessage;

  const StageState({
    required this.journeyId,
    required this.stages,
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.isLoading,
    required this.errorMessage,
    required this.order,
    required this.filters,
  });

  /// Initial empty state
  factory StageState.initial() {
    return const StageState(
      journeyId: '',
      stages: [],
      page: 1,
      pageSize: 10,
      pageCount: 0,
      isLoading: false,
      errorMessage: null,
      order: 'desc',
      filters: [],
    );
  }

  /// Derived helper (not stored)
  bool get hasNextPage => page < pageCount;

  /// Immutable update helper
  StageState setStagesState({
    String? journeyId,
    List<Stage>? stages,
    int? page,
    int? pageSize,
    int? pageCount,
    bool? isLoading,
    String? errorMessage,
    String? order,
    List? filters,
  }) {
    return StageState(
      journeyId: journeyId ?? this.journeyId,
      stages: stages ?? this.stages,
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
