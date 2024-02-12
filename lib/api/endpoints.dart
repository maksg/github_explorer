import 'package:github_explorer/api/http_method.dart';
import 'package:github_explorer/api/route.dart';

class SearchRepositoriesEndpoint extends Route {
  SearchRepositoriesEndpoint(String query) : super(
      path: 'search/repositories',
      method: HttpMethod.get,
      headers: {},
      parameters: { 'q' : query }
  );
}