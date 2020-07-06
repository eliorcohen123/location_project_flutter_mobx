import 'package:mobx/mobx.dart';

part 'phone_sms_auth_mobx.g.dart';

class PhoneSMSAuthMobXStore = _PhoneSMSAuthMobXStoreMobX
    with _$PhoneSMSAuthMobXStore;

abstract class _PhoneSMSAuthMobXStoreMobX with Store {
  @observable
  bool _success, _loading = false;
  @observable
  String _textError = '', _textOk = '', _verificationId;

  bool get successGet => _success;

  bool get loadingGet => _loading;

  String get textErrorGet => _textError;

  String get textOkGet => _textOk;

  String get verificationIdGet => _verificationId;

  @action
  void success(bool success) {
    _success = success;
  }

  @action
  void loading(bool loading) {
    _loading = loading;
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
