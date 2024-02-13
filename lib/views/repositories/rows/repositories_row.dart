import 'package:flutter/material.dart';

import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/custom_views/archived_badge_view.dart';
import 'package:github_explorer/custom_views/avatar_image.dart';
import 'package:github_explorer/models/repository.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_details_view.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_details_view_model.dart';

class RepositoriesRow extends StatelessWidget {
  final Repository repository;
  final APIRequest apiRequest;

  const RepositoriesRow({super.key, required this.repository, required this.apiRequest});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          SizedBox(
            height: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AvatarImage(url: repository.avatarURL),
            )
          ),
          Text(
            repository.fullName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (repository.archived)
            const ArchivedBadgeView(),
        ],
      ),
      subtitle: repository.description.isNotEmpty ? Text(repository.description) : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              RepositoryDetailsView(
                viewModel: RepositoryDetailsViewModel(
                  apiRequest: apiRequest,
                  repository: repository
                )
              )
          )
        );
      },
    );
  }
}
