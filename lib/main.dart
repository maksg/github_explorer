import 'package:flutter/material.dart';

import 'package:github_explorer/views/repositories/repositories_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        searchBarTheme: SearchBarThemeData(shadowColor: MaterialStateProperty.all(Colors.transparent)),
      ),
      home: const RepositoriesView(),
    );
  }
}
