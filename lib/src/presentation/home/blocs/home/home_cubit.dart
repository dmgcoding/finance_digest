import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_digest/core/models/ui_msg.dart';
import 'package:finance_digest/src/domain/models/market_news.dart';
import 'package:finance_digest/src/domain/repos/news_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.newsRepo}) : super(HomeState.init()) {
    fetchNews();
  }
  final NewsRepo newsRepo;

  void fetchNews() async {
    try {
      final news = await newsRepo.getGeneralNews();
      emit(
          state.copyWith(isPending: false, news: news, msg: const UIMessage()));
    } catch (e) {
      emit(
        state.copyWith(
          isPending: false,
          msg: const UIMessage(
              errorMsg: 'Something went wrong. Please try again later.'),
        ),
      );
    }
  }
}
