part of 'home_cubit.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.news,
    required this.isPending,
    required this.msg,
  });
  final List<MarketNews> news;
  final UIMessage msg;
  final bool isPending;

  factory HomeState.init() => const HomeState(
        news: [],
        isPending: true,
        msg: UIMessage(),
      );

  HomeState copyWith({
    List<MarketNews>? news,
    UIMessage? msg,
    bool? isPending,
  }) =>
      HomeState(
        news: news ?? this.news,
        msg: msg ?? this.msg,
        isPending: isPending ?? this.isPending,
      );

  @override
  List<Object> get props => [news, msg, isPending];
}
