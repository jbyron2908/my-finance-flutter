import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyFinanceGraphqlClient {
  GraphQLClient get client {
    return _clientValueNotifier.value;
  }
  
  ValueNotifier<GraphQLClient> _clientValueNotifier;

  final HttpLink httpLink = HttpLink(
    uri: 'http://10.0.2.2:4466',
  );

  Future<void> setup() async {
    print("setup graphql - start");

    _clientValueNotifier = ValueNotifier(GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink as Link,
    ));

    print("setup graphql - complete");
  }

  Future<QueryResult> query() async {
    return await client.query(QueryOptions(document: firstQuery));
  }

  String firstQuery = r'''
  query Models {
    models {
      id
      name
      atributes {
        id
        name
        type
      }
    }
  }
  ''';
}
