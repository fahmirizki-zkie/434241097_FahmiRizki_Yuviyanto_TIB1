import 'package:flutter/material.dart';

import '../widgets/ticket_card.dart';

/// Ticket list page placeholder.
class TicketListPage extends StatelessWidget {
  const TicketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ticket List')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          TicketCard(title: 'Network outage report', status: 'Open'),
          TicketCard(title: 'Printer issue on floor 2', status: 'In Progress'),
        ],
      ),
    );
  }
}
