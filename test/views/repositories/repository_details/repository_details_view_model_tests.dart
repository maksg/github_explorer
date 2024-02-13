import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/models/repository.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_details_view_model.dart';

import '../../../mocks/api/request_manager_mock.dart';

void main() {
  late RequestManagerMock requestManager;
  late APIRequest apiRequest;
  late Repository repository;
  late RepositoryDetailsViewModel viewModel;

  setUp(() async {
    requestManager = RequestManagerMock();
    apiRequest = APIRequest(requestManager);

    final file = File('test/resources/api/search_repositories_response.json');
    final repositoryJSON = json.decode(await file.readAsString())['items'][0];
    repository = RepositorySerializer().fromJSON(repositoryJSON);

    viewModel = RepositoryDetailsViewModel(apiRequest: apiRequest, repository: repository);
  });

  group('Test constructors', () {
    test('Constructor should correctly assign variables', () {
      expect(viewModel.apiRequest, apiRequest);
      expect(viewModel.repository, repository);
    });
  });
}
