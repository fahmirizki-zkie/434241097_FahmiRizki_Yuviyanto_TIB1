import '../entities/ticket_entity.dart';

/// Domain contract for ticket operations.
abstract class TicketRepository {
  Future<List<TicketEntity>> getTickets();

  Future<TicketEntity> getTicketDetail(String id);

  Future<void> createTicket({
    required String title,
    required String description,
  });

  Future<void> updateTicketStatus({required String id, required String status});
}
