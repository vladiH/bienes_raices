import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/token/token_imp_repository.dart';
import 'package:bienes_servicios/src/repositories/token/token_repository.dart';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static TokenRepository tokenRepository = TokenRepositoryImp();
  static Link link;
  static HttpLink httpLink = HttpLink(
      //uri: 'https://bienes.herokuapp.com/graphql',
      uri: 'http://192.168.0.11:4000/graphql');
  static void setToken() {
    AuthLink alink = AuthLink(getToken: () async {
      String token = await tokenRepository.getToken();
      return 'Bearer $token';
    });
    GraphQLConfig.link = alink.concat(GraphQLConfig.httpLink);
  }

  static void removeToken() {
    GraphQLConfig.link = null;
  }

  static Link getLink() {
    return GraphQLConfig.link != null
        ? GraphQLConfig.link
        : GraphQLConfig.httpLink;
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: getLink(),
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: getLink(),
    );
  }

  Future mutate(String query, dynamic variables) async {
    QueryResult result;
    if (variables != null) {
      result = await clientToQuery().mutate(MutationOptions(
        documentNode: gql(query),
        variables: variables,
      ));
    } else {
      result = await clientToQuery()
          .mutate(MutationOptions(documentNode: gql(query)));
    }
    final Map<String, dynamic> map = Map<String, dynamic>.from(result.data);
    final Response response = Response.fromJson(map[map.keys.elementAt(0)]);
    if (response.getToken != null) {
      tokenRepository.setToken(response.getToken);
    }
    return response;
  }

  Future query(String query, dynamic variables) async {
    QueryResult result;
    if (variables != null) {
      result = await clientToQuery()
          .query(QueryOptions(documentNode: gql(query), variables: variables));
    } else {
      result =
          await clientToQuery().query(QueryOptions(documentNode: gql(query)));
    }
    final Map<String, dynamic> map = Map<String, dynamic>.from(result.data);
    final Response response = Response.fromJson(map[map.keys.elementAt(0)]);
    if (response.getToken != null) {
      tokenRepository.setToken(response.getToken);
    }
    return response;
  }
}

GraphQLConfig graphQLConfig = new GraphQLConfig();
