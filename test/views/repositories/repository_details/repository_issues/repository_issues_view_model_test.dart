import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/models/repository.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_issues/repository_issues_view_model.dart';

import '../../../../mocks/api/request_manager_mock.dart';

void main() {
  late RequestManagerMock requestManager;
  late APIRequest apiRequest;
  late Repository repository;
  late RepositoryIssuesViewModel viewModel;

  setUp(() async {
    requestManager = RequestManagerMock();
    apiRequest = APIRequest(requestManager);

    final file = File('test/resources/api/search_repositories_response.json');
    final repositoryJSON = json.decode(await file.readAsString())['items'][0];
    repository = RepositorySerializer().fromJSON(repositoryJSON);

    viewModel = RepositoryIssuesViewModel(apiRequest: apiRequest, repository: repository);
  });

  group('Test constructors', () {
    test('Constructor should correctly assigned variables', () {
      expect(viewModel.apiRequest, apiRequest);
      expect(viewModel.repository, repository);
    });
  });

  group('Test loadings', () {
    test('startLoading method should update isLoading and call onUpdateView', () async {
      viewModel.isLoading = false;
      bool onUpdateViewCalled = false;
      viewModel.onUpdateView = () {
        onUpdateViewCalled = true;
      };

      viewModel.startLoading();
      expect(viewModel.isLoading, true);
      expect(onUpdateViewCalled, true);
    });

    test('finishLoading method should update isLoading and call onUpdateView', () async {
      viewModel.isLoading = true;
      bool onUpdateViewCalled = false;
      viewModel.onUpdateView = () {
        onUpdateViewCalled = true;
      };

      viewModel.finishLoading();
      expect(viewModel.isLoading, false);
      expect(onUpdateViewCalled, true);
    });
  });

  group('Test API requests', () {
    test('searchRepositories should call loadings and return repositories', () async {
      viewModel.isLoading = false;
      int onUpdateViewCalled = 0;
      viewModel.onUpdateView = () {
        onUpdateViewCalled += 1;
      };
      final file = File('test/resources/api/repository_issues_response.json');
      requestManager.response = await file.readAsString();

      await viewModel.fetchIssues();
      expect(viewModel.isLoading, false);
      expect(onUpdateViewCalled, 2);
      expect(viewModel.issues.length, 1);
      expect(viewModel.issues[0].id, 2125926794);
    });
  });
}
