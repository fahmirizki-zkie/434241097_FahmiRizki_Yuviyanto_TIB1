import 'package:flutter/material.dart';

import 'helpdesk_tickets_page.dart';

class HelpdeskEmptyTicketsPage extends StatelessWidget {
  const HelpdeskEmptyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpdeskTicketsPage(initiallyEmpty: true);
  }
}
