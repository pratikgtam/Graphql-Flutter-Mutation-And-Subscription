class GqlDocuments {
  static String mutationString() {
    return '''
mutation createCase {
  createCase(applicants: [{name: "Flutter"}) {
    uuid
  }
}
    ''';
  }

  static String subscriptionString(String uuid) {
    return '''
    subscription {
  caseResults(uuid: $uuid) {
    
    name
  }
}
    ''';
  }
}
