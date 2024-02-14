import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/models/repository.dart';
import 'package:github_explorer/models/repository_issue.dart';

class RepositoryIssuesViewModel {
  final APIRequest apiRequest;
  final Repository repository;
  List<RepositoryIssue> issues = [];
  bool isLoading = false;

  Function()? onUpdateView;

  RepositoryIssuesViewModel({ required this.apiRequest, required this.repository });

  void startLoading() {
    isLoading = true;
    onUpdateView?.call();
  }

  void finishLoading() {
    isLoading = false;
    onUpdateView?.call();
  }

  Future<void> fetchIssues() async {
    startLoading();
    final fullName = repository.fullName;
    issues = await apiRequest.fetchRepositoryIssues(fullName);
    finishLoading();
  }
}
