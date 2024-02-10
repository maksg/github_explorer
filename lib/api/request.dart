import 'dart:convert';
import 'dart:io';

import 'package:github_explorer/api/http_method.dart';
import 'package:github_explorer/api/route.dart';
import 'package:github_explorer/api/serializer.dart';

class Request {
  HttpClientRequest request;

  Request._(this.request);

  static Future<Request> create(String baseURL, Route route) async {
    final HttpClient client = HttpClient();
    final method = route.method.name;
    final url = Uri.parse(baseURL + route.path);

    if (route.method == HttpMethod.get) {
      url.replace(queryParameters: route.parameters.map((key, value) => MapEntry(key, value?.toString())));
    }

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

    return Request._(clientRequest);
  }

  Future<String> make() async {
    final response = await request.close();
    return await response.transform(utf8.decoder).join();
  }

  Future<dynamic> makeJSON() async {
    final result = await make();
    return json.decode(result);
  }

  Future<T> makeObject<T>(Serializer<T> serializer) async {
    final responseJSON = await makeJSON();
    return serializer.fromJSON(responseJSON);
  }

  Future<List<T>> makeList<T>(Serializer<T> serializer) async {
    final responseJSON = await makeJSON();
    return List<T>.from(responseJSON.map((e) => serializer.fromJSON(e)));
  }
}
