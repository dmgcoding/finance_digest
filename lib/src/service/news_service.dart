import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finance_digest/core/api_endpoints/api_endpoints.dart';
import 'package:finance_digest/core/exceptions/base_exception.dart';
import 'package:finance_digest/src/domain/models/market_news.dart';

class NewsService {
  const NewsService({required this.dio});
  final Dio dio;

  Future<List<MarketNews>> fetchGeneralMarketNews() async {
    try {
      final response = await dio.get(
        NewsEP.getGeneralNews,
      );
      return marketNewsListFromJson(jsonEncode(response.data));
    } on DioException catch (dioError) {
      throw BaseException(dioError.response?.data['error']);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
