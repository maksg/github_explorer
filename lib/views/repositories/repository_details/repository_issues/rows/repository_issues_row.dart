import 'package:flutter/material.dart';

import 'package:github_explorer/models/repository_issue.dart';

class RepositoryIssuesRow extends StatelessWidget {
  final RepositoryIssue issue;

  const RepositoryIssuesRow({ super.key, required this.issue });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(issue.title),
    );
  }
}
