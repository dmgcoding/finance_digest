import 'package:finance_digest/core/const/assets.dart';
import 'package:finance_digest/core/const/colors.dart';
import 'package:finance_digest/core/utils/utils.dart';
import 'package:finance_digest/locator.dart';
import 'package:finance_digest/src/presentation/login/bloc/login/login_cubit.dart';
import 'package:finance_digest/src/presentation/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'first_name_input.dart';
import 'last_name_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: lc()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.msg.errorMsg != null) {
          showSnackbar(context, state.msg.errorMsg!);
        } else if (state.msg.successMsg != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (cxt) => const OnBoardingPage(),
            ),
          );
        }
        context.read<LoginCubit>().clearMsgs();
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.secondary50,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (!state.isValid) return;
                context.read<LoginCubit>().submit();
              },
              backgroundColor: state.isValid
                  ? AppColors.primary600
                  : AppColors.primary600.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                AppAssets.rightArrow,
                width: 12,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ListView(
                children: [
                  Text(
                    'Your legal name',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: AppColors.text900,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'We need to know a bit about you so that we can create your account.',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.text500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const FirstNameInputField(),
                  const SizedBox(height: 21),
                  const LastNameInputField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
