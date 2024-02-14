import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {

  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);
    final weeksAgo = (difference.inDays / 7).floor();
    if (weeksAgo >= 4) {
      return 'on ${DateFormat.yMMMd().format(this)}';
    } else if (weeksAgo >= 2) {
      return '$weeksAgo weeks ago';
    } else if (weeksAgo >= 1) {
      return 'a week ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return 'yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return 'an hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return 'a minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'just now';
    }
  }

}
