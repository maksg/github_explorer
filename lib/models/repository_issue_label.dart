import 'dart:ui';

import 'package:github_explorer/abstracts/serializer.dart';

class RepositoryIssueLabel {
  int id;
  String name;
  Color color;

  RepositoryIssueLabel({
    required this.id,
    required this.name,
    required this.color,
  });
}

class RepositoryIssueLabelSerializer extends Serializer<RepositoryIssueLabel> {
  @override
  RepositoryIssueLabel fromJSON(Map<String, dynamic> json) {
    return RepositoryIssueLabel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      color: Color(int.tryParse('FF${json['color']}', radix: 16) ?? 0xffff0000),
    );
  }
}
