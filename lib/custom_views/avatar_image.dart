import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String? url;
  const AvatarImage({ super.key, required this.url });

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return const Icon(Icons.no_accounts);
    } else {
      return Image.network(url!);
    }
  }
}
