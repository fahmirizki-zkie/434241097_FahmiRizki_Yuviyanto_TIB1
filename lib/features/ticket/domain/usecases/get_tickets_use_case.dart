import '../entities/ticket_entity.dart';
import '../repositories/ticket_repository.dart';

/// Loads ticket list for dashboard/list pages.
class GetTicketsUseCase {
  const GetTicketsUseCase(this._repository);

  final TicketRepository _repository;

  Future<List<TicketEntity>> call() {
    return _repository.getTickets();
  }
}
