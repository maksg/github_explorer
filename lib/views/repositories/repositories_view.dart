import 'package:flutter/material.dart';

import 'package:github_explorer/views/repositories/repositories_view_model.dart';
import 'package:github_explorer/views/repositories/rows/repositories_row.dart';

class RepositoriesView extends StatefulWidget {
  final RepositoriesViewModel viewModel;

  const RepositoriesView({ super.key, required this.viewModel });

  @override
  RepositoriesViewState createState() => RepositoriesViewState();
}

class RepositoriesViewState extends State<RepositoriesView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.onUpdateView = () => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Repositories',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          searchBar(),
          Expanded(child: listView()),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SizedBox(
        height: 40,
        child: SearchBar(
          leading: const Icon(Icons.search),
          hintText: 'Search',
          onSubmitted: (String query) {
            widget.viewModel.searchRepositories(query);
          },
        ),
      ),
    );
  }

  Widget listView() {
    if (widget.viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: widget.viewModel.repositories.length,
        itemBuilder: (context, index) {
          return RepositoriesRow(repository: widget.viewModel.repositories[index], apiRequest: widget.viewModel.apiRequest);
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
