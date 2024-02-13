import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/models/repository.dart';

class RepositoriesViewModel {
  final APIRequest apiRequest;
  List<Repository> repositories = [];
  bool isLoading = false;

  Function()? onUpdateView;

  RepositoriesViewModel({ required this.apiRequest });

  void startLoading() {
    isLoading = true;
    onUpdateView?.call();
  }

  void finishLoading() {
    isLoading = false;
    onUpdateView?.call();
  }

  Future<void> searchRepositories(String query) async {
    startLoading();
    repositories = (await apiRequest.searchRepositories(query)).items;
    finishLoading();
  }
}
