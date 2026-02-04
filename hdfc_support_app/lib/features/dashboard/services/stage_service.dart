import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/stage_model.dart';

class StageService {
  final String _baseUrl = dotenv.env['API_BASE_URL']!;

  Future<StageSearchResult> fetchStages({
    required String journeyId,
    required int page,
    required int pageSize,
    required String order,
    required String token,
    required List<dynamic> filters,
  }) async {
    final uri = Uri.parse('$_baseUrl/stages/search');

    dev.log('Fetching stages');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'journey_id': journeyId,
        'page': page,
        'pageSize': pageSize,
        'order': order,
        'filters': filters,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (decoded['success'] != 'true') {
      throw Exception(decoded['errMessage'] ?? 'Unknown error');
    }

    final responseData = decoded['responseData'] as Map<String, dynamic>?;

    final List stagesJson = responseData?['stages'] ?? [];

    final int pageCount =
        int.tryParse(responseData?['pageCount']?.toString() ?? '0') ?? 0;

    final stages = stagesJson.map((item) => Stage.fromApi(item)).toList();

    return StageSearchResult(stages: stages, pageCount: pageCount);
  }
}

class StageSearchResult {
  final List<Stage> stages;
  final int pageCount;

  const StageSearchResult({required this.stages, required this.pageCount});

  // @override
  // String toString() {
  //   return 'StageSearchResult(pageCount: $pageCount, stages: $stages)';
  // }
}
