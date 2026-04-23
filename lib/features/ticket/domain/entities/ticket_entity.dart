/// Domain ticket object shared by all ticket use cases.
class TicketEntity {
  const TicketEntity({
    required this.id,
    required this.title,
    required this.status,
  });

  final String id;
  final String title;
  final String status;
}
