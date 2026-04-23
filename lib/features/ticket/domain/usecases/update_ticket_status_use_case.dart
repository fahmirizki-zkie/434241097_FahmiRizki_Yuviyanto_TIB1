import '../repositories/ticket_repository.dart';

/// Updates ticket handling status.
class UpdateTicketStatusUseCase {
  const UpdateTicketStatusUseCase(this._repository);

  final TicketRepository _repository;

  Future<void> call({required String id, required String status}) {
    return _repository.updateTicketStatus(id: id, status: status);
  }
}
