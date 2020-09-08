import 'package:mobx/mobx.dart';

part 'mobx_sign_in_firebase.g.dart';

class MobXSignInFirebaseStore = _MobXSignInFirebase
    with _$MobXSignInFirebaseStore;

abstract class _MobXSignInFirebase with Store {
  @observable
  bool _isSuccess, _isLoading = false, _isLoggedIn = false;
  @observable
  String _textError = '';

  bool get isSuccessGet => _isSuccess;

  bool get isLoadingGet => _isLoading;

  bool get isLoggedInGet => _isLoggedIn;

  String get textErrorGet => _textError;

  @action
  void isSuccess(bool isSuccess) {
    _isSuccess = isSuccess;
  }

  @action
  void isLoading(bool isLoading) {
    _isLoading = isLoading;
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
