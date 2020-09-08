import 'package:mobx/mobx.dart';

part 'mobx_phone_sms_auth.g.dart';

class MobXPhoneSMSAuthStore = _MobXPhoneSMSAuth with _$MobXPhoneSMSAuthStore;

abstract class _MobXPhoneSMSAuth with Store {
  @observable
  bool _isSuccess, _isLoading = false;
  @observable
  String _textError = '', _textOk = '', _verificationId;

  bool get isSuccessGet => _isSuccess;

  bool get isLoadingGet => _isLoading;

  String get textErrorGet => _textError;

  String get textOkGet => _textOk;

  String get verificationIdGet => _verificationId;

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

  @action
  void textOk(String textOk) {
    _textOk = textOk;
  }

  @action
  void verificationId(String verificationId) {
    _verificationId = verificationId;
  }
}
