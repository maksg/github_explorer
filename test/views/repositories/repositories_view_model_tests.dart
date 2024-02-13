import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/views/repositories/repositories_view_model.dart';

import '../../mocks/api/request_manager_mock.dart';

void main() {
  late RequestManagerMock requestManager;
  late APIRequest apiRequest;
  late RepositoriesViewModel viewModel;

  setUp(() {
    requestManager = RequestManagerMock();
    apiRequest = APIRequest(requestManager);
    viewModel = RepositoriesViewModel(apiRequest: apiRequest);
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
      final file = File('test/resources/api/search_repositories_response.json');
      requestManager.response = await file.readAsString();

      await viewModel.searchRepositories('axmol');
      expect(viewModel.isLoading, false);
      expect(onUpdateViewCalled, 2);
      expect(viewModel.repositories.length, 1);
      expect(viewModel.repositories[0].id, 223598953);
    });
  });
}
