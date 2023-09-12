import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/widgets/login_widget.dart';
import 'package:renconsport/widgets/profile_view.dart';

Future<void> loginAction() async {
  setState(() {
    isBusy = true;
    errorMessage = '';
  });

  try {
    final Credentials credentials =
        await auth0.webAuthentication(scheme: appScheme).login();

    setState(() {
      isBusy = false;
      _credentials = credentials;
    });
  } on Exception catch (e, s) {
    debugPrint('login error: $e - stack: $s');

    setState(() {
      isBusy = false;
      errorMessage = e.toString();
    });
  }
}

Future<void> logoutAction() async {
  await auth0.webAuthentication(scheme: appScheme).logout();

  setState(() {
    _credentials = null;
  });
}
