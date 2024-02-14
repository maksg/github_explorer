import 'package:github_explorer/abstracts/serializer.dart';
import 'package:github_explorer/models/repository_issue_label.dart';

class RepositoryIssue {
  int id;
  int number;
  String title;
  String userLogin;
  String? avatarURL;
  List<RepositoryIssueLabel> labels;
  int commentsCount;
  DateTime createdAt;
  Uri? htmlURL;

  RepositoryIssue({
    required this.id,
    required this.number,
    required this.title,
    required this.userLogin,
    this.avatarURL,
    required this.labels,
    required this.commentsCount,
    required this.createdAt,
    this.htmlURL,
  });
}

class RepositoryIssueSerializer extends Serializer<RepositoryIssue> {
  @override
  RepositoryIssue fromJSON(Map<String, dynamic> json) {
    return RepositoryIssue(
      id: json['id'] ?? 0,
      number: json['number'] ?? 0,
      title: json['title'] ?? '',
      userLogin: json['user']['login'],
      avatarURL: json['user']['avatar_url'],
      labels: List.from(json['labels'].map((e) => RepositoryIssueLabelSerializer().fromJSON(e))),
      commentsCount: json['comments'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
      htmlURL: Uri.tryParse(json['html_url'])
    );
  }
}
