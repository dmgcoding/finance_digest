import 'package:finance_digest/core/const/colors.dart';
import 'package:finance_digest/src/presentation/login/bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstNameInputField extends StatelessWidget {
  const FirstNameInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextField(
          onChanged: (val) => context.read<LoginCubit>().changeFirstName(val),
          decoration: InputDecoration(
              labelText: 'First name',
              hintText: 'type your first name here',
              labelStyle: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.text400,
              ),
              border: const UnderlineInputBorder(),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              errorText: state.firstName.errorMsg()),
        );
      },
    );
  }
}
