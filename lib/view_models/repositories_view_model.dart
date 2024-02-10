import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/models/repository.dart';

class RepositoriesViewModel {
  final APIRequest apiRequest = APIRequest();
  List<Repository> repositories = [];
  bool isLoading = false;

  Function()? onUpdateView;

  Future<void> fetchRepositories() async {
    isLoading = true;
    onUpdateView?.call();

    repositories = await apiRequest.fetchRepositories();

    isLoading = false;
    onUpdateView?.call();
  }
}
