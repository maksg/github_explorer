import 'dart:convert';

import 'package:github_explorer/abstracts/base_request.dart';
import 'package:github_explorer/abstracts/serializer.dart';

class RequestMock implements BaseRequest {
  final String response;

  RequestMock(this.response);

  @override
  Future<String> make() async {
    return response;
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
