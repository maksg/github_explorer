import 'package:github_explorer/abstracts/base_request_manager.dart';
import 'package:github_explorer/api/route.dart';

import 'request_mock.dart';

class RequestManagerMock implements BaseRequestManager {
  String response = '';

  RequestManagerMock();

  @override
  Future<RequestMock> create(String baseURL, Route route) async {
    return RequestMock(response);
  }
}
