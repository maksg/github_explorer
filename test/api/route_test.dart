import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/api/http_method.dart';
import 'package:github_explorer/api/route.dart';

void main() {
  const String path = 'path';
  const HttpMethod method = HttpMethod.post;
  const Map<String, String> headers = { 'header' : 'value' };
  const Map<String, dynamic> parameters = { 'parameter' : 3 };
  late Route route;

  setUp(() {
    route = Route(path: path, method: method, headers: headers, parameters: parameters);
  });

  group('Test constructors', () {
    test('Constructor should correctly assigned variables', () {
      expect(route.path, path);
      expect(route.method, method);
      expect(route.headers, headers);
      expect(route.parameters, parameters);
    });
  });
}
