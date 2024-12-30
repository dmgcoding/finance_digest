import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_digest/core/models/ui_msg.dart';
import 'package:finance_digest/src/domain/repos/auth_repo.dart';
import 'package:finance_digest/src/presentation/login/view/models/first_name_input.dart';
import 'package:finance_digest/src/presentation/login/view/models/last_name_input.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginState.init());
  final AuthRepo authRepo;

  void clearMsgs() {
    emit(state.copyWith(msg: const UIMessage()));
  }

  void changeFirstName(String val) {
    final input = FirstNameInput.dirty(value: val);
    emit(state.copyWith(
        firstName: input, isValid: Formz.validate([input, state.lastName])));
  }

  void changeLastName(String val) {
    final input = LastNameInput.dirty(value: val);
    emit(state.copyWith(
        lastName: input, isValid: Formz.validate([input, state.firstName])));
  }

  Future<void> submit() async {
    if (state.status == FormzSubmissionStatus.inProgress) return;
    if (state.firstName.isPure || state.lastName.isPure) return;
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await authRepo.login(
          firstName: state.firstName.value, lastName: state.lastName.value);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          msg: const UIMessage(successMsg: 'Welcome!'),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          msg: UIMessage(errorMsg: e.toString())));
    }
  }
}
