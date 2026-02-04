class Stage {
  final String transactionId;
  final String state;
  final String timestamp;
  final String reason;
  final String source;
  final String device;
  final String event;
  final int retryCount;

  const Stage({
    required this.transactionId,
    required this.state,
    required this.timestamp,
    required this.reason,
    required this.source,
    required this.retryCount,
    required this.device,
    required this.event,
  });

  factory Stage.fromApi(Map<String, dynamic> data) {
    return Stage(
      transactionId: data['transactionId'] ?? '',
      state: data['state'] ?? '',
      timestamp: data['timestamp'] ?? '',
      reason: data['reason'] ?? '',
      source: data['source'] ?? '',
      retryCount: data['retryCount'] ?? 0,
      device: data['device'] ?? '',
      event: data['event'] ?? '',
    );
  }

  // @override
  // String toString() {
  //   return 'Stage(txId: $transactionId, state: $state)';
  // }
}
