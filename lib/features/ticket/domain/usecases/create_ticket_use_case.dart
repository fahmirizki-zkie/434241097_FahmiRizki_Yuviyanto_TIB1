import '../repositories/ticket_repository.dart';

/// Creates a new support ticket.
class CreateTicketUseCase {
  const CreateTicketUseCase(this._repository);

  final TicketRepository _repository;

  Future<void> call({required String title, required String description}) {
    return _repository.createTicket(title: title, description: description);
  }
}
