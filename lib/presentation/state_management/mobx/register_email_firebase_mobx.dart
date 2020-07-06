import 'package:mobx/mobx.dart';

part 'register_email_firebase_mobx.g.dart';

class RegisterEmailFirebaseMobXStore = _RegisterEmailFirebaseMobXStoreMobX
    with _$RegisterEmailFirebaseMobXStore;

abstract class _RegisterEmailFirebaseMobXStoreMobX with Store {
  @observable
  bool _success, _loading = false;
  @observable
  String _textError = '';

  bool get successGet => _success;

  bool get loadingGet => _loading;

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
  void textError(String textError) {
    _textError = textError;
  }
}
