import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApiClient {
  static SingleChildWidget buildProvider() =>
      Provider.value(value: ApiClient());

  static var _token = Flavor.values.githubToken;

  GraphQLClient get graphqlClient {
    if (_clientValueNotifier == null) {
      _setup();
    }
    return _clientValueNotifier.value;
  }

  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink _httpLink = HttpLink(
    uri: Flavor.values.baseUrlGraphQL,
  );

  final AuthLink _authLink = AuthLink(getToken: () => "Bearer $_token");

  void _setup() {
    var link = _authLink.concat(_httpLink);
    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ));
  }
}
