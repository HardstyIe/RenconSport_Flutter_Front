class ConstsAuth0 {
  static const String AUTH0_DOMAIN = "dev-rsb7ct14ymtfm6w1.eu.auth0.com";
  static const String AUTH0_CLIENT_ID = "eQzcSr1qbGm3l3ScTiJZc9bk7iulxBq2";
  static const String AUTH0_ISSUER = "HTTPS://$AUTH0_DOMAIN";
  static const String AUTH0_REDIRECT_URI =
      "com.example.renconsport://login-callback";
}

class Api {
  static const String NESTJS_BASE_URL = "http://localhost:3000/";
}

class GlobalData {
  static final GlobalData _instance = GlobalData._internal();
  factory GlobalData() => _instance;
  GlobalData._internal();

  String? authToken;

  setToken(String token) {
    authToken = token;
  }

  String? getToken() {
    return authToken;
  }
}
