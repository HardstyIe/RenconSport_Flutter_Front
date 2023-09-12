import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/states/auth.dart';

final auth0NotifierProvider =
    StateNotifierProvider<Auth0Controller, Auth0State>(
        (ref) => Auth0Controller());

class Auth0Controller extends StateNotifier<Auth0State> {
  Auth0Controller() : super(const Auth0State());

  final repository = Auth0Repository();
}
