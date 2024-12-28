import 'package:finance_digest/src/domain/models/market_news.dart';
import 'package:finance_digest/src/service/news_service.dart';

class NewsRepo {
  const NewsRepo({required this.newsService});
  final NewsService newsService;

  Future<List<MarketNews>> getGeneralNews() async {
    try {
      final news = await newsService.fetchGeneralMarketNews();
      return news;
    } catch (e) {
      rethrow;
    }
  }
}
