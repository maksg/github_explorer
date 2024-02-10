import 'package:github_explorer/api/http_method.dart';

class Route {
  String path;
  HttpMethod method;
  Map<String, String> headers;
  Map<String, dynamic> parameters;

  Route({ required this.path, required this.method, required this.headers, required this.parameters });
}
