import 'package:github_explorer/models/repository.dart';

class RepositoriesViewModel {
  List<Repository> repositories = [];
  bool isLoading = false;

  Function()? onUpdateView;

  Future<void> fetchRepositories() async {
    isLoading = true;
    onUpdateView?.call();

    await Future.delayed(const Duration(seconds: 2));
    repositories = [Repository(id: 'id', name: 'name')];

    isLoading = false;
    onUpdateView?.call();
  }
}
