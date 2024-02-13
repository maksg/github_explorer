import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/models/repositories.dart';

void main() {
  group('Test RepositoriesSerializer', () {
    test('fromJSON method should return valid repositories', () async {
      final file = File('test/resources/api/search_repositories_response.json');
      final repositoriesJSON = json.decode(await file.readAsString());

      final repositories = RepositoriesSerializer().fromJSON(repositoriesJSON);
      expect(repositories.items.length, 1);
      final repository = repositories.items[0];
      expect(repository.id, 223598953);
    });
  });
}
