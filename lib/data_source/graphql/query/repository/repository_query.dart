String getRepositoriesQuery = r'''
query ReadRepositories($limit: Int!) {
  viewer {
    repositories(last: $limit) {
      nodes {
        name
        createdAt
      }
    }
  }
}
''';
