import 'package:flutter/material.dart';
import 'package:github_explorer/view_models/repositories_view_model.dart';

class RepositoriesView extends StatefulWidget {
  const RepositoriesView({super.key});

  @override
  RepositoriesViewState createState() => RepositoriesViewState();
}

class RepositoriesViewState extends State<RepositoriesView> {
  final RepositoriesViewModel viewModel = RepositoriesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.onUpdateView = () => setState(() {});
    viewModel.fetchRepositories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Repositories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: viewModel.repositories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(viewModel.repositories[index].name),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    viewModel.onUpdateView = null;
    super.dispose();
  }
}
