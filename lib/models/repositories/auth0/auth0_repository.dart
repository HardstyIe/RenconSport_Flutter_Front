import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:renconsport/constants/auth.dart';

class Auth0Repository {
  Future<Map<String, Object>> initAction(String storedRefreshToken) async {
    final response = await _tokenRequest(storedRefreshToken);
    final idToken = _parseIdToken(response?.idToken);
    final profile = await _getUserDetails(response?.accessToken);

    const FlutterSecureStorage()
        .write(key: "refresh_token", value: response!.refreshToken);
    return {...idToken, ...profile};
  }

  Future<TokenResponse?> _tokenRequest(String? storedRefreshToken) async {
    return await FlutterAppAuth().token(TokenRequest(
        ConstsAuth0.AUTH0_CLIENT_ID, ConstsAuth0.AUTH0_REDIRECT_URI,
        issuer: ConstsAuth0.AUTH0_ISSUER, refreshToken: storedRefreshToken));
  }

  Future<Map<String, Object>> login() async {
    final AuthorizationTokenResponse? result = await _authorizeExchange();
    final Map<String, Object> idToken = _parseIdToken(result?.idToken);
    final Map<String, Object> profile =
        await _getUserDetails(result?.accessToken);

    await const FlutterSecureStorage()
        .write(key: "refresh_token", value: result!.refresh_token);

    return {...idToken, ...profile};
  }

  Future<AuthorizationTokenResponse?> _authorizeExchange() async {
    return await FlutterAppAuth().authorizeAndExchangeCode(
      AuthorizationTokenRequest(
          ConstsAuth0.AUTH0_CLIENT_ID, ConstsAuth0.AUTH0_REDIRECT_URI,
          issuer: ConstsAuth0.AUTH0_ISSUER,
          scopes: <String>["openid", "profile", "offline_access", "email"],
          prompt_values: ["login"]),
    );
  }

  Map<String, Object> _parseIdToken(String? idToken) {
    final List<String> parts = idToken!.split(".");
    assert(parts.length == 3);

    return Map<String, Object>.from(
        jsonDecode(utf8.decode(base64Url.normalize(parts[1]))));
  }

  Future<Map<String, Object>> _getUserDetails(String? accessToken) async {
    final http.Response response = await http.get(
        Uri.parse(ConstsAuth0.AUTH0_ISSUER + "/userinfo"),
        headers: <String, String>{"Authorization": "Bearer $accessToken"});

    if (response.statusCode == 200) {
      return Map<String, Object>.from(jsonDecode(response.body));
    } else {
      throw Exception("Impossible de récupérer les données utilisateur");
    }
  }
}
