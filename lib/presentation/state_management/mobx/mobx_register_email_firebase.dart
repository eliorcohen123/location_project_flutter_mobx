import 'package:mobx/mobx.dart';

part 'mobx_register_email_firebase.g.dart';

class MobXRegisterEmailFirebaseStore = _MobXRegisterEmailFirebase
    with _$MobXRegisterEmailFirebaseStore;

abstract class _MobXRegisterEmailFirebase with Store {
  @observable
  bool _iSuccess, _isLoading = false;
  @observable
  String _textError = '';

  bool get isSuccessGet => _iSuccess;

  bool get isLoadingGet => _isLoading;

  String get textErrorGet => _textError;

  @action
  void isSuccess(bool isSuccess) {
    _iSuccess = isSuccess;
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
