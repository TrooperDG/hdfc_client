import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/journey_model.dart';

class JourneyService {
  final String _baseUrl = dotenv.env['API_BASE_URL']!;

  Future<JourneySearchResult> fetchJourneys({
    required String customerId,
    required int page,
    required int pageSize,
    required String order,
    required String token,
    required List<dynamic> filters,
  }) async {
    final uri = Uri.parse('$_baseUrl/journeys/search');

    dev.log('Fetching journeys');

    final response = await http
        .post(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },

          body: jsonEncode({
            'customer_id': customerId,
            'page': page,
            'pageSize': pageSize,
            'order': order,
            'filters': filters,
          }),
        )
        .timeout(const Duration(seconds: 15));

    // print(response.body);

    //if data not recieved prperly
    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (decoded['success'] != 'true') {
      throw Exception(decoded['errMessage'] ?? 'Unknown error');
    }

    final responseData = decoded['responseData'] as Map<String, dynamic>?;

    // print(responseData);

    final List journeysJson = responseData?['journeyList'] ?? [];
    // print(journeysJson[0]);
    final int pageCount =
        int.tryParse(responseData?['pageCount']?.toString() ?? '0') ?? 0;

    final journeys = journeysJson.map((item) => Journey.fromApi(item)).toList();
    // print(journeys);

    return JourneySearchResult(journeys: journeys, pageCount: pageCount);
  }
}

class JourneySearchResult {
  final List<Journey> journeys;
  final int pageCount;

  const JourneySearchResult({required this.journeys, required this.pageCount});
  // @override
  // String toString() {
  //   return 'JourneySearchResult(pageCount: $pageCount, journeys: $journeys)';
  // }
}
