import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyFinanceGraphqlClient {
  ValueNotifier<GraphQLClient> client;

  final HttpLink httpLink = HttpLink(
    uri: 'https://graphql.org/swapi-graphql',
  );

  Future<void> setup() async {
    print("setup graphql - start");
    client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: httpLink as Link,
      ),
    );

    print("setup graphql - complete");
  }
}
