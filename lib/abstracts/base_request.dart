import 'package:github_explorer/abstracts/serializer.dart';

abstract class BaseRequest {
  Future<String> make();
  Future<dynamic> makeJSON();
  Future<T> makeObject<T>(Serializer<T> serializer);
  Future<List<T>> makeList<T>(Serializer<T> serializer);
}
