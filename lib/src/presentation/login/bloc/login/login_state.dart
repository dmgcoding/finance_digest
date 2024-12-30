part of 'login_cubit.dart';

@immutable
final class LoginState extends Equatable {
  const LoginState({
    required this.firstName,
    required this.lastName,
    required this.status,
    required this.msg,
    required this.isValid,
  });
  final FirstNameInput firstName;
  final LastNameInput lastName;
  final FormzSubmissionStatus status;
  final UIMessage msg;
  final bool isValid;

  factory LoginState.init() => const LoginState(
        firstName: FirstNameInput.pure(),
        lastName: LastNameInput.pure(),
        status: FormzSubmissionStatus.initial,
        msg: UIMessage(),
        isValid: false,
      );

  LoginState copyWith({
    FirstNameInput? firstName,
    LastNameInput? lastName,
    FormzSubmissionStatus? status,
    UIMessage? msg,
    bool? isValid,
  }) =>
      LoginState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        status: status ?? this.status,
        msg: msg ?? this.msg,
        isValid: isValid ?? this.isValid,
      );

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        status,
        msg,
        isValid,
      ];
}
