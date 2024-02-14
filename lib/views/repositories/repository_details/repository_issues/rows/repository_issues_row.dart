import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:github_explorer/custom_views/avatar_image.dart';
import 'package:github_explorer/custom_views/repository_issue_label_view.dart';
import 'package:github_explorer/extensions/date_time_time_ago.dart';
import 'package:github_explorer/models/repository_issue.dart';

class RepositoryIssuesRow extends StatelessWidget {
  final RepositoryIssue issue;

  const RepositoryIssuesRow({ super.key, required this.issue });

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
                child: AvatarImage(url: issue.avatarURL),
              )
          ),
          Text(
            issue.title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ] + issue.labels.map((label) => RepositoryIssueLabelView(label: label)).toList(),
      ),
      subtitle: Text('#${issue.number} opened ${issue.createdAt.timeAgo()} by ${issue.userLogin}'),
      trailing: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(alignment: PlaceholderAlignment.middle, child: Icon(Icons.comment_outlined)),
            const WidgetSpan(child: SizedBox(width: 4)),
            TextSpan(
              text: '${issue.commentsCount}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
            ),
          ]
        ),
      ),
      onTap: () {
        final url = issue.htmlURL;
        if (url != null) {
          launchUrl(url);
        }
      },
    );
  }
}
