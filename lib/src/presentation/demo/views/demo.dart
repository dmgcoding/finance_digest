import 'package:finance_digest/locator.dart';
import 'package:finance_digest/src/domain/models/market_news.dart';
import 'package:finance_digest/src/domain/repos/news_repo.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<MarketNews> news = [];
  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future<void> getNews() async {
    final list = await lc<NewsRepo>().getGeneralNews();
    setState(() {
      news = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => getNews(),
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, i) {
            final n = news[i];
            return ListTile(
              title: Text(n.summary),
              subtitle: Text(n.category),
            );
          },
        ),
      ),
    );
  }
}
