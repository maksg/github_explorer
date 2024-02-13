import 'package:github_explorer/abstracts/base_request_manager.dart';
import 'package:github_explorer/api/endpoints.dart';
import 'package:github_explorer/models/repositories.dart';

class APIRequest {
  final String _baseURL = 'api.github.com';
  final BaseRequestManager _requestManager;

  const APIRequest(this._requestManager);

  Future<Repositories> searchRepositories(String query) async {
    final endpoint = SearchRepositoriesEndpoint(query);
    final request = await _requestManager.create(_baseURL, endpoint);
    return await request.makeObject(RepositoriesSerializer());
  }
}
