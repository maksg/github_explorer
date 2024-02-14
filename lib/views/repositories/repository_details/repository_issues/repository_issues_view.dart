import 'package:flutter/material.dart';

import 'package:github_explorer/views/repositories/repository_details/repository_issues/repository_issues_view_model.dart';
import 'package:github_explorer/views/repositories/repository_details/repository_issues/rows/repository_issues_row.dart';

class RepositoryIssuesView extends StatefulWidget {
  final RepositoryIssuesViewModel viewModel;

  const RepositoryIssuesView({ super.key, required this.viewModel });

  @override
  RepositoriesViewState createState() => RepositoriesViewState();
}

class RepositoriesViewState extends State<RepositoryIssuesView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.onUpdateView = () => setState(() {});
    widget.viewModel.fetchIssues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(
          '${widget.viewModel.repository.openIssuesCount} open issues',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: listView(),
    );
  }

  Widget listView() {
    if (widget.viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: widget.viewModel.issues.length,
        itemBuilder: (context, index) {
          return RepositoryIssuesRow(issue: widget.viewModel.issues[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.14));
        },
      );
    }
  }

  @override
  void dispose() {
    widget.viewModel.onUpdateView = null;
    super.dispose();
  }
}
