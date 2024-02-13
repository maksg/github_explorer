import 'package:github_explorer/models/repository.dart';
import 'package:github_explorer/api/serializer.dart';

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
