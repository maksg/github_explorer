import 'dart:convert';
import 'dart:io';

import 'package:github_explorer/abstracts/base_request_manager.dart';
import 'package:github_explorer/api/http_method.dart';
import 'package:github_explorer/api/request.dart';
import 'package:github_explorer/api/route.dart';

class RequestManager implements BaseRequestManager {
  const RequestManager();

  @override
  Future<Request> create(String baseURL, Route route) async {
    final HttpClient client = HttpClient();
    final method = route.method.name;
    final parameters = route.method == HttpMethod.get ? route.parameters : <String, dynamic>{};
    final url = Uri.https(baseURL, route.path, parameters);

    final clientRequest = await client.openUrl(method, url)
      ..headers.contentType = ContentType.json;

    route.headers.forEach((key, value) {
      clientRequest.headers.add(key, value);
    });

    if (route.method != HttpMethod.get) {
      final body = json.encode(route.parameters);
      clientRequest.headers.contentLength = body.length;
      clientRequest.write(body);
    }

    return Request(clientRequest);
  }
}
