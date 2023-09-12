/// -----------------------------------
///          External Packages
/// -----------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/models/controllers/auth0/auth0_controller.dart';
import '/views/login/login_view.dart';
import '/views/login/profile_view.dart';

const appScheme = 'HTTPS';

/// -----------------------------------
///           Profile Widget
/// -----------------------------------

/// -----------------------------------
///            Login Widget
/// -----------------------------------

/// -----------------------------------
///                 App
/// -----------------------------------

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0State = ref.watch(auth0NotifierProvider);

    useEffect(() {
      Future.microtask(() async {
        ref.watch(auth0NotifierProvider.notifier).initAction();
      });

      return;
    }, const []);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Auth0 state management"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: auth0State.isBusy
              ? const CircularProgressIndicator()
              : auth0State.isLoggedIn
                  ? const ProfileView()
                  : const LoginView(),
        ),
      ),
    );
  }
}
