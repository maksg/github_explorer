import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/extensions/date_time_time_ago.dart';

void main() {
  group('Test DateTime timeAgo extension', () {
    test('DateTime.now() should return \'just now\'', () async {
      final date = DateTime.now();
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, 'just now');
    });
    test('DateTime.now() - 4 seconds should return \'4 seconds ago\'', () async {
      final date = DateTime.now().add(const Duration(seconds: -4));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, '4 seconds ago');
    });
    test('DateTime.now() - 1 minute should return \'a minute ago\'', () async {
      final date = DateTime.now().add(const Duration(minutes: -1));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, 'a minute ago');
    });
    test('DateTime.now() - 3 minutes should return \'3 minute ago\'', () async {
      final date = DateTime.now().add(const Duration(minutes: -3));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, '3 minutes ago');
    });
    test('DateTime.now() - 1 hour should return \'an hour ago\'', () async {
      final date = DateTime.now().add(const Duration(hours: -1));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, 'an hour ago');
    });
    test('DateTime.now() - 3 hours should return \'3 hours ago\'', () async {
      final date = DateTime.now().add(const Duration(hours: -3));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, '3 hours ago');
    });
    test('DateTime.now() - 1 day should return \'yesterday\'', () async {
      final date = DateTime.now().add(const Duration(days: -1));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, 'yesterday');
    });
    test('DateTime.now() - 4 days should return \'4 days ago\'', () async {
      final date = DateTime.now().add(const Duration(days: -4));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, '4 days ago');
    });
    test('DateTime.now() - 7 days should return \'last week\'', () async {
      final date = DateTime.now().add(const Duration(days: -7));
      final timeAgoText = date.timeAgo();
      expect(timeAgoText, 'last week');
    });
  });
}
