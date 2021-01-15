abstract class TokenRepository {
  Future<void> setToken(String token);

  Future<String> getToken();
}
