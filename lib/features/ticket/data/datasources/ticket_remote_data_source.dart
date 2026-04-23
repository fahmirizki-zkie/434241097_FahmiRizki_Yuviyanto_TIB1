import '../models/ticket_model.dart';

/// Ticket data source contract.
abstract class TicketRemoteDataSource {
  Future<List<TicketModel>> getTickets();

  Future<TicketModel> getTicketDetail(String id);

  Future<void> createTicket({
    required String title,
    required String description,
  });

  Future<void> updateTicketStatus({required String id, required String status});
}

/// Dummy in-memory source used in UI-first phase.
/// Replace this implementation with real API integration later.
class TicketRemoteDataSourceImpl implements TicketRemoteDataSource {
  TicketRemoteDataSourceImpl();

  final List<TicketModel> _tickets = <TicketModel>[
    const TicketModel(
      id: 't-1',
      title: 'Network outage report',
      status: 'Open',
    ),
    const TicketModel(
      id: 't-2',
      title: 'Printer issue on floor 2',
      status: 'In Progress',
    ),
    const TicketModel(
      id: 't-3',
      title: 'VPN access request',
      status: 'Waiting Approval',
    ),
  ];

  @override
  Future<List<TicketModel>> getTickets() async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    return List<TicketModel>.unmodifiable(_tickets);
  }

  @override
  Future<TicketModel> getTicketDetail(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    return _tickets.firstWhere(
      (TicketModel item) => item.id == id,
      orElse: () => throw StateError('Ticket not found'),
    );
  }

  @override
  Future<void> createTicket({
    required String title,
    required String description,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    _tickets.insert(
      0,
      TicketModel(
        id: 't-${_tickets.length + 1}',
        title: title.trim().isEmpty ? 'Untitled Ticket' : title.trim(),
        status: 'Open',
      ),
    );
  }

  @override
  Future<void> updateTicketStatus({
    required String id,
    required String status,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 140));

    final int index = _tickets.indexWhere((TicketModel item) => item.id == id);
    if (index == -1) {
      throw StateError('Ticket not found');
    }

    final TicketModel current = _tickets[index];
    _tickets[index] = TicketModel(
      id: current.id,
      title: current.title,
      status: status,
    );
  }
}
