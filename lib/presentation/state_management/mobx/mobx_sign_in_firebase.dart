import 'package:mobx/mobx.dart';

part 'mobx_sign_in_firebase.g.dart';

class MobXSignInFirebaseStore = _MobXSignInFirebase
    with _$MobXSignInFirebaseStore;

abstract class _MobXSignInFirebase with Store {
  @observable
  bool _isSuccess, _isLoading = false;
  @observable
  String _textError = '';

  bool get isSuccessGet => _isSuccess;

  bool get isLoadingGet => _isLoading;


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
  void textError(String textError) {
    _textError = textError;
  }
}
