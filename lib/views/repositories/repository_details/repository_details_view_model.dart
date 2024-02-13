import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/models/repository.dart';

class RepositoryDetailsViewModel {
  final APIRequest apiRequest;
  final Repository repository;

  RepositoryDetailsViewModel({ required this.apiRequest, required this.repository });
}
