class Journey {
  final String journeyId;
  final String journeyName;
  final String journeyStatus;
  final String journeyCreateTimeStamp;

  const Journey({
    required this.journeyId,
    required this.journeyName,
    required this.journeyStatus,
    required this.journeyCreateTimeStamp,
  });

  factory Journey.fromApi(Map<String, dynamic> data) {
    return Journey(
      journeyId: data['journeyId'] ?? '',
      journeyName: data['journeyName'] ?? '',
      journeyStatus: data['journeyStatus'] ?? '',
      journeyCreateTimeStamp: data['journeyCreateTimeStamp'] ?? '',
    );
  }
}
