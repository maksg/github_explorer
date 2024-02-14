import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/models/repository_issue.dart';

void main() {
  group('Test RepositoryIssueSerializer', () {
    test('fromJSON method should return valid repositories', () async {
      final file = File('test/resources/api/repository_issues_response.json');
      final repositoryIssueJSON = json.decode(await file.readAsString())[0];

      final repositoryIssue = RepositoryIssueSerializer().fromJSON(repositoryIssueJSON);
      expect(repositoryIssue.id, 2125926794);
      expect(repositoryIssue.number, 1659);
      expect(repositoryIssue.title, 'Support for visionOS');
      expect(repositoryIssue.userLogin, 'paulocoutinhox');
      expect(repositoryIssue.avatarURL, 'https://avatars.githubusercontent.com/u/395096?v=4');
      expect(repositoryIssue.labels.length, 1);
      expect(repositoryIssue.labels[0].id, 1693827677);
      expect(repositoryIssue.commentsCount, 1);
      expect(repositoryIssue.createdAt, DateTime.parse('2024-02-08T19:30:53Z'));
      expect(repositoryIssue.htmlURL, Uri.parse('https://github.com/axmolengine/axmol/issues/1659'));
    });
  });
}
