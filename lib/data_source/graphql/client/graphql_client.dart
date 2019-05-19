import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_api.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client_contract.dart'
    as GraphQLClientContract;

class MyFinanceGraphqlClient implements GraphQLClientContract.GraphQLClient {
  static var _token = "";

  GraphQLClient get graphqlClient {
    return _clientValueNotifier.value;
  }

  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AuthLink(getToken: () => "Bearer $_token");

  @override
  void setup() {
    print("Setup GraphqlClient - Start");

    var link = _authLink.concat(_httpLink as Link);

    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ));

    print("Setup GraphqlClient - Complete");
  }

  @override
  RepositoryGraphqlApi getRepositoryApi() {
    return MyFinanceRepositoryGraphqlApi(_clientValueNotifier.value);
  }
}
