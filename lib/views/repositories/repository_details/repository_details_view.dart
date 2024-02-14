import 'package:flutter/material.dart';

import 'package:github_explorer/custom_views/archived_badge_view.dart';
import 'package:github_explorer/custom_views/avatar_image.dart';
import 'package:github_explorer/extensions/date_time_time_ago.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_details_view_model.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_issues/repository_issues_view.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_issues/repository_issues_view_model.dart';

class RepositoryDetailsView extends StatelessWidget {
  final RepositoryDetailsViewModel viewModel;

  const RepositoryDetailsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: appBarTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            aboutView(),
            divider(),
            infoViews(),
            divider(),
            openIssuesView(context),
            divider(),
            lastUpdatedView(),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.black.withOpacity(0.14));
  }

  Widget appBarTitle() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: AvatarImage(url: viewModel.repository.avatarURL),
          )
        ),
        Text(
          viewModel.repository.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        if (viewModel.repository.archived)
          const ArchivedBadgeView(),
      ],
    );
  }
  
  Widget itemPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: child,
    );
  }

  Widget aboutView() {
    return itemPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(viewModel.repository.description),
        ],
      ),
    );
  }

  Widget infoView(IconData iconData, String text) {
    return itemPadding(
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(alignment: PlaceholderAlignment.middle, child: Icon(iconData)),
            const WidgetSpan(child: SizedBox(width: 10)),
            TextSpan(text: text),
          ]
        ),
      ),
    );
  }
  
  Widget? licenseView() {
    final license = viewModel.repository.license;
    if (license != null) {
      return infoView(Icons.assignment, license);
    }
    return null;
  }

  Widget stargazersView() {
    final stargazersCount = viewModel.repository.stargazersCount;
    return infoView(Icons.star, '$stargazersCount stars');
  }

  Widget forksView() {
    final forksCount = viewModel.repository.forksCount;
    return infoView(Icons.alt_route, '$forksCount forks');
  }

  Widget languageView() {
    final language = viewModel.repository.language;
    return infoView(Icons.code, language);
  }

  Widget infoViews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        licenseView(),
        stargazersView(),
        forksView(),
        languageView(),
      ].whereType<Widget>().toList(),
    );
  }

  Widget openIssuesView(BuildContext context) {
    final openIssuesCount = viewModel.repository.openIssuesCount;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              RepositoryIssuesView(
                viewModel: RepositoryIssuesViewModel(
                  apiRequest: viewModel.apiRequest,
                  repository: viewModel.repository
                )
              )
          )
        );
      },
      child: itemPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const WidgetSpan(alignment: PlaceholderAlignment.middle, child: Icon(Icons.bug_report)),
                  const WidgetSpan(child: SizedBox(width: 10)),
                  const TextSpan(text: 'Issues'),
                  const WidgetSpan(child: SizedBox(width: 10)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                      child: Text('$openIssuesCount'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastUpdatedView() {
    return itemPadding(child: Text('Last updated ${viewModel.repository.pushedAt.timeAgo()}'));
  }
}
