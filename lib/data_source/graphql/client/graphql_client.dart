import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyFinanceGraphqlClient {

  GraphQLClient get graphqlClient {
    return _clientValueNotifier.value;
  }

  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AuthLink(getToken: () => "Bearer $_token");

  Future<void> setup() async {
    print("setup graphql - start");

    var link = _authLink.concat(_httpLink as Link);

    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ));

    print("setup graphql - complete");
  }
}
