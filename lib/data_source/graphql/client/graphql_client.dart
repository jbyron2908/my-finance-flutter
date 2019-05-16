import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyFinanceGraphqlClient {
  GraphQLClient get client {
    return _clientValueNotifier.value;
  }

  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink _authLink =
      AuthLink(getToken: () => "Bearer <token>");

  Future<void> setup() async {
    print("setup graphql - start");

    var link = _authLink.concat(_httpLink as Link);

    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ));

    print("setup graphql - complete");
  }

  Future<QueryResult> query(int nRepositories) async {
    return await client.query(QueryOptions(
      document: countriesQuery,
      variables: <String, dynamic>{
        'nRepositories': nRepositories,
      },
    ));
  }

  String countriesQuery = r'''
  query ReadRepositories($nRepositories: Int!) {
    viewer {
      repositories(last: $nRepositories) {
        nodes {
          name
          createdAt
        }
      }
    }
  }
  ''';
}
