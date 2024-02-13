import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/api/api_request.dart';

import '../mocks/api/request_manager_mock.dart';

void main() {
  late RequestManagerMock requestManager;
  late APIRequest apiRequest;

  setUp(() {
    requestManager = RequestManagerMock();
    apiRequest = APIRequest(requestManager);
  });

  group('Test endpoints', () {
    test('searchRepositories method should return valid repositories', () async {
      final file = File('test/resources/api/search_repositories_response.json');
      requestManager.response = await file.readAsString();
      final repositories = await apiRequest.searchRepositories('axmol');

      expect(repositories.items.length, 1);
      final repository = repositories.items[0];
      expect(repository.id, 223598953);
    });
  });
}
