import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_api.dart';

class MyFinanceGraphqlClient {
  static var _token = "";

  GraphQLClient get graphqlClient {
    return _clientValueNotifier.value;
  }

  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AuthLink(getToken: () => "Bearer $_token");

  void setup() {
    print("Setup GraphqlClient - Start");

    var link = _authLink.concat(_httpLink as Link);

    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ));

    print("Setup GraphqlClient - Complete");
  }

  RepositoryGraphqlApi getRepositoryApi() {
    return RepositoryGraphqlApi(_clientValueNotifier.value);
  }
}
