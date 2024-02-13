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
    test('Search repositories endpoint returns correct repositories', () async {
      final file = File('test/resources/api/search_repositories_response.json');
      requestManager.response = await file.readAsString();
      final repositories = await apiRequest.searchRepositories('axmol');

      expect(repositories.items.length, 1);
      final repository = repositories.items[0];
      expect(repository.id, 223598953);
      expect(repository.name, 'axmol');
      expect(repository.fullName, 'axmolengine/axmol');
      expect(repository.avatarURL, 'https://avatars.githubusercontent.com/u/108861585?v=4');
      expect(repository.description, 'Axmol Engine – A Multi-platform Engine for Desktop, XBOX (UWP) and Mobile games. (A fork of Cocos2d-x-4.0)');
      expect(repository.pushedAt, DateTime.parse('2024-02-12T19:48:46Z'));
      expect(repository.stargazersCount, 609);
      expect(repository.forksCount, 167);
      expect(repository.language, 'C++');
      expect(repository.archived, false);
      expect(repository.openIssuesCount, 11);
      expect(repository.license, 'MIT License');
    });
  });
}
