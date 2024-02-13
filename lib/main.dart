import 'package:flutter/material.dart';

import 'package:github_explorer/api/api_request.dart';
import 'package:github_explorer/api/request_manager.dart';
import 'package:github_explorer/views/repositories/repositories_view.dart';
import 'package:github_explorer/views/repositories/repositories_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final APIRequest apiRequest = const APIRequest(RequestManager());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        searchBarTheme: SearchBarThemeData(shadowColor: MaterialStateProperty.all(Colors.transparent)),
      ),
      home: RepositoriesView(viewModel: RepositoriesViewModel(apiRequest: apiRequest)),
    );
  }
}
