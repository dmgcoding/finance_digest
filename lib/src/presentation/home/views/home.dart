import 'package:finance_digest/core/const/colors.dart';
import 'package:finance_digest/locator.dart';
import 'package:finance_digest/src/domain/repos/auth_repo.dart';
import 'package:finance_digest/src/presentation/home/blocs/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(newsRepo: lc()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeCubit>().fetchNews();
          },
          child: ListView(
            children: [
              const SizedBox(height: 24),
              Builder(builder: (context) {
                final name = lc<AuthRepo>().firstName;
                final text = 'Hey $name,';
                return Text(
                  text,
                  style: GoogleFonts.raleway(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                  ),
                );
              }),
              const SizedBox(height: 10),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.isPending) {
                    return Text(
                      'fetching news...',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                  if (state.msg.errorMsg != null) {
                    return Text(
                      state.msg.errorMsg.toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.news.length,
                      itemBuilder: (context, i) {
                        final n = state.news[i];
                        return NewsCard(
                          n: n,
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
