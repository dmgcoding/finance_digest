import 'package:finance_digest/core/const/assets.dart';
import 'package:finance_digest/core/const/colors.dart';
import 'package:finance_digest/locator.dart';
import 'package:finance_digest/src/domain/repos/auth_repo.dart';
import 'package:finance_digest/src/presentation/home/home.dart';
import 'package:finance_digest/src/presentation/login/view/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    //in case we have to wrap with a bloc provider
    //we can do that here
    return const SplashView();
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      final loggedIn = lc<AuthRepo>().checkIfLoggedIn();
      if (loggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (cxt) => const LoginPage(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (cxt) => const LoginPage(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          width: MediaQuery.sizeOf(context).width * 0.5,
        ),
      ),
    );
  }
}
