import 'package:formz/formz.dart';

class FirstNameInputErrors {
  const FirstNameInputErrors({this.isEmpty = false});

  final bool isEmpty;
}

class FirstNameInput extends FormzInput<String, FirstNameInputErrors> {
  const FirstNameInput.pure() : super.pure('');

  const FirstNameInput.dirty({String value = ''}) : super.dirty(value);

  String? errorMsg() {
    if (isPure) return null;
    if (value.isEmpty) {
      return "First name can't be empty";
    }
    return null;
  }

  @override
  FirstNameInputErrors? validator(String value) {
    if (value.isEmpty) return const FirstNameInputErrors(isEmpty: true);
    return null;
  }
}
