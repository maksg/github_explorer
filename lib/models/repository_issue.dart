import 'package:github_explorer/abstracts/serializer.dart';

class RepositoryIssue {
  int id;
  int number;
  String title;
  List<String> labels;
  DateTime createdAt;

  RepositoryIssue({
    required this.id,
    required this.number,
    required this.title,
    required this.labels,
    required this.createdAt,
  });
}

class RepositoryIssueSerializer extends Serializer<RepositoryIssue> {
  @override
  RepositoryIssue fromJSON(Map<String, dynamic> json) {
    return RepositoryIssue(
      id: json['id'] ?? 0,
      number: json['number'] ?? 0,
      title: json['title'] ?? '',
      labels: (json['labels'] as List<dynamic>).map((e) => e['name'] as String).toList(),
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
    );
  }
}
