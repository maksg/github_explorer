import 'dart:io';

import 'package:github_explorer/api/http_method.dart';
import 'package:github_explorer/api/request.dart';
import 'package:github_explorer/api/route.dart';
import 'package:github_explorer/models/repository.dart';

class APIRequest {
  final HttpClient client = HttpClient();
  final String baseURL = 'https://api.github.com/';

  Future<List<Repository>> fetchRepositories(String userName) async {
    final route = Route(path: 'users/$userName/repos', method: HttpMethod.get, headers: {}, parameters: {});
    final request = await Request.create(baseURL, route);
    return await request.makeList(RepositorySerializer());
  }
}
