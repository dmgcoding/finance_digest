import 'package:finance_digest/core/const/colors.dart';
import 'package:finance_digest/src/presentation/login/bloc/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LastNameInputField extends StatelessWidget {
  const LastNameInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return TextField(
          onChanged: (val) => context.read<LoginCubit>().changeLastName(val),
          decoration: InputDecoration(
            labelText: 'Last name',
            hintText: 'type your last name here',
            labelStyle: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.text400,
            ),
            border: const UnderlineInputBorder(),
            errorText: state.lastName.errorMsg(),
          ),
        );
      },
    );
  }
}
