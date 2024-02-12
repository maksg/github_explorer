import 'dart:io';

import 'package:github_explorer/api/endpoints.dart';
import 'package:github_explorer/api/request.dart';
import 'package:github_explorer/models/repository.dart';

class APIRequest {
  final HttpClient client = HttpClient();
  final String baseURL = 'api.github.com';

  Future<Repositories> searchRepositories(String query) async {
    final endpoint = SearchRepositoriesEndpoint(query);
    final request = await Request.create(baseURL, endpoint);
    return await request.makeObject(RepositoriesSerializer());
  }
}
