import 'package:flutter/material.dart';

/// Reusable ticket item card for ticket lists.
class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.title,
    required this.status,
    this.onTap,
  });

  final String title;
  final String status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        subtitle: Text('Status: $status'),
      ),
    );
  }
}
