import 'package:github_explorer/api/serializer.dart';

class Repository {
  int id;
  String name;

  Repository({ required this.id, required this.name });
}

class RepositorySerializer extends Serializer<Repository> {
  @override
  Repository fromJSON(Map<String, dynamic> json) {
    return Repository(
        id: json['id'],
        name: json['name'],
    );
  }
}
