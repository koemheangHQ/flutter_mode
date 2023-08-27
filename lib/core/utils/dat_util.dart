import 'package:intl/intl.dart';

extension DateUtil on int {
  String readableTimestamp() {
    final formatter = DateFormat('HH:mm a');
    final date = DateTime.fromMillisecondsSinceEpoch(this);
    return formatter.format(date);
  }

  String readableLastSeen({required DateTime date, required DateTime now, String? lastSeen = "Last seen"}) {
    date = DateTime.fromMillisecondsSinceEpoch(this);
    now = DateTime.now();

    if (now.year != date.year || now.month != date.month) {
      final formatter = DateFormat('MMM dd, yyyy');
      return '${lastSeen!} on ${formatter.format(date)}';
    } else if (now.day != date.day) {
      final diff = now.day - date.day;
      return '${lastSeen!} $diff day${(diff > 1) ? 's' : ''} ago';
    } else if (now.hour != date.hour) {
      final diff = now.hour - date.hour;
      return '${lastSeen!} $diff hour${(diff > 1) ? 's' : ''} ago';
    } else if (now.minute != date.minute) {
      final diff = now.minute - date.minute;
      return '${lastSeen!} $diff minute${(diff > 1) ? 's' : ''} ago';
    } else if (now.second != date.second) {
      final diff = now.second - date.second;
      return '${lastSeen!} $diff second${(diff > 1) ? 's' : ''} ago';
    }
    return '';
  }
}
