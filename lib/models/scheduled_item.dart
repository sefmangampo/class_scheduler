class ScheduledItem {
  final int id;
  final String name;
  final int day;
  final int startHour;
  final int endHour;

  int get duration => endHour - startHour;

  ScheduledItem(
      {required this.id,
      required this.name,
      required this.day,
      required this.startHour,
      required this.endHour});
}
