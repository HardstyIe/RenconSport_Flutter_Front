import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:mobx/mobx.dart';

class Auth = _Auth with _$Auth;

abstract class _Auth with Store {
  @observable
  Auth0 auth0 = Auth0(
      "dev-rsb7ct14ymtfm6w1.eu.auth0.com", "eQzcSr1qbGm3l3ScTiJZc9bk7iulxBq2");
}
