import 'package:finance_digest/src/service/local_storage_service.dart';

class AuthRepo {
  AuthRepo({required this.localStorageService});
  final LocalStorageService localStorageService;

  String? _firstName;
  String? _lastName;

  //getters
  String? get firstName => _firstName;
  String? get lastName => _lastName;

  Future<void> login(
      {required String firstName, required String lastName}) async {
    try {
      await localStorageService.saveStrValue(
          LocalStorageService.firstNameKey, firstName);
      await localStorageService.saveStrValue(
          LocalStorageService.lastNameKey, lastName);
      _firstName = firstName;
      _lastName = lastName;
    } catch (e) {
      rethrow;
    }
  }

  bool checkIfLoggedIn() {
    _firstName =
        localStorageService.getStrValue(LocalStorageService.firstNameKey);
    _lastName =
        localStorageService.getStrValue(LocalStorageService.lastNameKey);
    return _firstName != null;
  }
}
