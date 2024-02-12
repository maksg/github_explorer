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

class Repositories {
  List<Repository> items;

  Repositories({ required this.items });
}

class RepositoriesSerializer extends Serializer<Repositories> {
  @override
  Repositories fromJSON(Map<String, dynamic> json) {
    return Repositories(
      items: List.from(json['items'].map((e) => RepositorySerializer().fromJSON(e))),
    );
  }
}