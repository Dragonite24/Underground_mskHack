class Event {
  Event({
    this.name,
    this.shortDesc,
    this.adress,
    this.contactEmail,
    this.dateTime,
    this.type,
    this.eventSite,
    this.fullDescription,
  });

  final String name;
  final String shortDesc;
  final EventType type;
  final DateTime dateTime;
  final String fullDescription;
  final String adress;
  final String contactEmail;
  final String eventSite;
}

enum EventType {
  Exhibition, // Выставка
  Forum,
  Session,
  Meetup, // Круглый стол
  Webinar,
  DemoDay,
  Lection,
  OnLineLection,
  StrategicSession,
}
