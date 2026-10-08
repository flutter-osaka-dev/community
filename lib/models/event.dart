class EventItem {
  final String title;
  final String date;
  final String? url;

  const EventItem({
    required this.title,
    required this.date,
    this.url,
  });
}
