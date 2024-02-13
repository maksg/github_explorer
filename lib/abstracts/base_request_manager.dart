import 'package:github_explorer/abstracts/base_request.dart';
import 'package:github_explorer/api/route.dart';

abstract class BaseRequestManager {
  Future<BaseRequest> create(String baseURL, Route route);
}
