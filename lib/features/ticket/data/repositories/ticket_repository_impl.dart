import '../../domain/entities/ticket_entity.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../datasources/ticket_remote_data_source.dart';

/// Data-layer implementation of ticket repository contract.
class TicketRepositoryImpl implements TicketRepository {
  TicketRepositoryImpl(this._dataSource);

  final TicketRemoteDataSource _dataSource;

  @override
  Future<List<TicketEntity>> getTickets() async {
    final models = await _dataSource.getTickets();
    return models.map((ticket) => ticket.toEntity()).toList();
  }

  @override
  Future<TicketEntity> getTicketDetail(String id) async {
    final model = await _dataSource.getTicketDetail(id);
    return model.toEntity();
  }

  @override
  Future<void> createTicket({
    required String title,
    required String description,
  }) {
    return _dataSource.createTicket(title: title, description: description);
  }

  @override
  Future<void> updateTicketStatus({
    required String id,
    required String status,
  }) {
    return _dataSource.updateTicketStatus(id: id, status: status);
  }
}
