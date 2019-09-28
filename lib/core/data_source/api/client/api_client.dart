import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';

class ApiClient {
  static var _token = Flavor.instance.values.githubToken;

  GraphQLClient get graphqlClient {
    if (_clientValueNotifier == null) {
      _setup();
    }
    return _clientValueNotifier.value;
  }

  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink _httpLink = HttpLink(
    uri: Flavor.instance.values.baseUrlGraphQL,
  );

  final AuthLink _authLink = AuthLink(getToken: () => "Bearer $_token");

  void _setup() {
    print("Setup GraphqlClient - Start");

    var link = _authLink.concat(_httpLink as Link);
    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ));

    print("Setup GraphqlClient - Complete");
  }
}
