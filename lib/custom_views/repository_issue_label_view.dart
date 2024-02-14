import 'package:flutter/material.dart';

import 'package:github_explorer/models/repository_issue_label.dart';

class RepositoryIssueLabelView extends StatelessWidget {
  final RepositoryIssueLabel label;

  const RepositoryIssueLabelView({ super.key, required this.label });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: label.color),
        borderRadius: BorderRadius.circular(20),
        color: label.color.withOpacity(0.1),
      ),
      child: Text(
        label.name,
        style: TextStyle(
          color: label.color,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
