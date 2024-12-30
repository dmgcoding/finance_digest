import 'package:formz/formz.dart';

class LastNameInputErrors {
  const LastNameInputErrors({this.isEmpty = false});

  final bool isEmpty;
}

class LastNameInput extends FormzInput<String, LastNameInputErrors> {
  const LastNameInput.pure() : super.pure('');

  const LastNameInput.dirty({String value = ''}) : super.dirty(value);

  String? errorMsg() {
    if (isPure) return null;
    if (value.isEmpty) {
      return "Last name can't be empty";
    }
    return null;
  }

  @override
  LastNameInputErrors? validator(String value) {
    if (value.isEmpty) return const LastNameInputErrors(isEmpty: true);
    return null;
  }
}
