import 'package:github_explorer/abstracts/serializer.dart';

class Repository {
  int id;
  String name;
  String fullName;
  String? avatarURL;
  String description;
  DateTime pushedAt;
  int stargazersCount;
  int forksCount;
  String language;
  bool archived;
  int openIssuesCount;
  String? license;

  Repository({
    required this.id,
    required this.name,
    required this.fullName,
    this.avatarURL,
    required this.description,
    required this.pushedAt,
    required this.stargazersCount,
    required this.forksCount,
    required this.language,
    required this.archived,
    required this.openIssuesCount,
    this.license
  });
}

class RepositorySerializer extends Serializer<Repository> {
  @override
  Repository fromJSON(Map<String, dynamic> json) {
    return Repository(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      avatarURL: json['owner']['avatar_url'],
      description: json['description'] ?? '',
      pushedAt: DateTime.tryParse(json['pushed_at']) ?? DateTime.now(),
      stargazersCount: json['stargazers_count'] ?? 0,
      forksCount: json['forks_count'] ?? 0,
      language: json['language'] ?? '',
      archived: json['archived'] ?? false,
      openIssuesCount: json['open_issues_count'] ?? 0,
      license: json['license']?['name'],
    );
  }
}
