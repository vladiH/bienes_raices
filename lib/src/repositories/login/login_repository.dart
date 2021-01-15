import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/graphql_config.dart';
import 'package:bienes_servicios/src/repositories/login/mutation.dart';
import 'package:bienes_servicios/src/repositories/login/query.dart';
import 'package:bienes_servicios/src/repositories/token/token_imp_repository.dart';
//import 'package:graphql_flutter/graphql_flutter.dart';
//import 'mutation.dart';
//import 'query.dart';

class LoginRepository {
  /*mutation(String query) async {
    return await clientGQL
        .mutate(MutationOptions(documentNode: gql(query), variables: {}));
  }*/
  queryLisAds() async {
    return await graphQLConfig.query(listAds(), null);
  }

  Future getCurrentUser() async {
    if (await GraphQLConfig.tokenRepository.getToken() != null) {
      GraphQLConfig.setToken();
    }
    final Response result = await graphQLConfig.query(me(), null);
    return result;
  }

  signOut() async {
    GraphQLConfig.removeToken();
    return TokenRepositoryImp().setToken(null);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    final Response result = await graphQLConfig.mutate(login(), {
      'usuario': {'email': email, 'password': password}
    });
    if (result.getToken != null) {
      GraphQLConfig.setToken();
    }
    return result;
  }
}
