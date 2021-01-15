import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/graphql_config.dart';

import 'mutation.dart';

class SingupRepository {
  Future singUp(String email, String password, String name, String lastname,
      String phone, String birthdate, String gender) async {
    final Response response = await graphQLConfig.mutate(mutationSingUp(), {
      'usuario': {
        'email': email,
        'password': password,
        'persona': {
          "nombres": name,
          "apellidos": lastname,
          "telefono": phone,
          "fecha_nacimiento": birthdate,
          "sexo": gender
        }
      }
    });
    return response;
  }

  Future confirmationCode(String email, String emailToken) async {
    final Response response = await graphQLConfig.mutate(
        mutationConfirmationCode(email, emailToken), null);
    return response;
  }

  Future changeEmailToken(String email) async {
    final Response response =
        await graphQLConfig.mutate(mutationChangeEmailToken(email), null);
    return response;
  }
}
