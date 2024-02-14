import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/models/repository_issue_label.dart';

void main() {
  group('Test RepositoryIssueLabelSerializer', () {
    test('fromJSON method should return valid repositories', () async {
      final file = File('test/resources/api/repository_issues_response.json');
      final repositoryIssueLabelJSON = json.decode(await file.readAsString())[0]['labels'][0];

      final repositoryIssueLabel = RepositoryIssueLabelSerializer().fromJSON(repositoryIssueLabelJSON);
      expect(repositoryIssueLabel.id, 1693827677);
      expect(repositoryIssueLabel.name, 'help wanted');
      expect(repositoryIssueLabel.color, const Color(0xff008672));
    });
  });
}
