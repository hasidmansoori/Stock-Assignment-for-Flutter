import 'package:dio/dio.dart';

class StockAPI {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> searchStocks(String query, String token) async {
    final response = await _dio.get(
      'https://illuminate-production.up.railway.app/api/stocks/search',
      queryParameters: {'query': query},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    }
    return [];
  }
}
