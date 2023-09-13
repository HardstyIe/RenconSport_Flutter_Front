import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:renconsport/constants/auth.dart';

const appScheme = "https";

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final Auth0? auth0;
  const MyApp({this.auth0, final Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserProfile? _user;

  late Auth0 auth0;
  late Auth0Web auth0Web;

  @override
  void initState() {
    super.initState();
    auth0 = widget.auth0 ??
        Auth0(ConstsAuth0.AUTH0_DOMAIN, ConstsAuth0.AUTH0_CLIENT_ID);
    auth0Web = Auth0Web(ConstsAuth0.AUTH0_DOMAIN, ConstsAuth0.AUTH0_CLIENT_ID);

    if (kIsWeb) {
      auth0Web.onLoad().then((final credentials) => setState(() {
            _user = credentials?.user;
          }));
    }
  }

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      }

      var credentials =
          await auth0.webAuthentication(scheme: appScheme).login();

      setState(() {
        _user = credentials.user;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        await auth0.webAuthentication(scheme: appScheme).logout();
        setState(() {
          _user = null;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              child: Row(children: [
            _user != null ? Text("logged in") : Text("logged out")
          ])),
          _user != null
              ? ElevatedButton(
                  onPressed: logout,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text('Logout'),
                )
              : ElevatedButton(
                  onPressed: login,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text('Login'),
                )
        ]),
      )),
    );
  }
}
