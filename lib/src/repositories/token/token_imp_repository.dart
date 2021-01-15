import 'package:bienes_servicios/src/repositories/token/token_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepositoryImp implements TokenRepository {
  static const String _tokenIndexKey = 'tokenIndex';

  @override
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(_tokenIndexKey);
    return token != null ? token : null;
  }

  @override
  Future<void> setToken(String token) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_tokenIndexKey, token);
  }
}
