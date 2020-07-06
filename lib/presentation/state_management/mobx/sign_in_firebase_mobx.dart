import 'package:mobx/mobx.dart';

part 'sign_in_firebase_mobx.g.dart';

class SignInFirebaseMobXStore = _SignInFirebaseMobXStoreMobX
    with _$SignInFirebaseMobXStore;

abstract class _SignInFirebaseMobXStoreMobX with Store {
  @observable
  bool _success, _loading = false, _isLoggedIn = false;
  @observable
  String _textError = '';

  bool get successGet => _success;

  bool get loadingGet => _loading;

  bool get isLoggedInGet => _isLoggedIn;

  String get textErrorGet => _textError;

  @action
  void success(bool success) {
    _success = success;
  }

  @action
  void loading(bool loading) {
    _loading = loading;
  }

  @action
  void isLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }

  @action
  void textError(String textError) {
    _textError = textError;
  }
}
