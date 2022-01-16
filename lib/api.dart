import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:grqphql_mutation_subscription/config.dart';

import 'gql_document.dart';

class ApiClients {
  Future<String> createCase() async {
    try {
      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.client();
      QueryResult result = await _client.mutate(
        MutationOptions(
          document: gql(GqlDocuments.mutationString()), // this
        ),
      );
      if (result.hasException) {
        debugPrint(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        debugPrint(result.data.toString());
      }

      return "ABC";
    } catch (e) {
      debugPrint(e.toString());
      return "ABC";
    }
  }

  Stream<QueryResult> caseResults(String uuid) {
    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.client();
    Stream<QueryResult> result = _client.subscribe(SubscriptionOptions(
        document: gql(GqlDocuments.subscriptionString(uuid))));
    return result;
  }
}
