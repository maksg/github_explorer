import 'dart:convert';
import 'dart:io';

import 'package:github_explorer/abstracts/base_request.dart';
import 'package:github_explorer/abstracts/serializer.dart';

class Request implements BaseRequest {
  final HttpClientRequest _request;

  Request(this._request);

  @override
  Future<String> make() async {
    final response = await _request.close();
    return await response.transform(utf8.decoder).join();
  }

  @override
  Future<dynamic> makeJSON() async {
    final result = await make();
    return json.decode(result);
  }

  @override
  Future<T> makeObject<T>(Serializer<T> serializer) async {
    final responseJSON = await makeJSON();
    return serializer.fromJSON(responseJSON);
  }

  @override
  Future<List<T>> makeList<T>(Serializer<T> serializer) async {
    final responseJSON = await makeJSON();
    return List<T>.from(responseJSON.map((e) => serializer.fromJSON(e)));
  }
}
