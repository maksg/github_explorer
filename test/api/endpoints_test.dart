import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/api/endpoints.dart';
import 'package:github_explorer/api/http_method.dart';

void main() {
  group('Test endpoints', () {
    test('SearchRepositoriesEndpoint should return valid Route parameters', () {
      const query = 'axmol';
      final endpoint = SearchRepositoriesEndpoint(query);
      expect(endpoint.path, 'search/repositories');
      expect(endpoint.method, HttpMethod.get);
      expect(endpoint.headers, {});
      expect(endpoint.parameters, { 'q' : query });
    });
  });
}
