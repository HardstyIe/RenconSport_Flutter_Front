import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:renconsport/models/controllers/auth0/auth0_controller.dart';
import 'package:renconsport/models/controllers/auth0/auth0_state.dart';

class LoginView extends HookConsumerWidget{
   LoginView({
    Key? key
  }):super(key: key)

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0State = ref.watch(auth0NotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(onPressed: () async {
          ref.read(auth0NotifierProvider.notifier).login();
        }, child: const Text("Login")),
        Text(auth0State.errorMessage??"")
      ],
    );
  }
}
