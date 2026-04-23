import 'package:flutter/foundation.dart';

import 'ticket_state.dart';

/// UI controller for ticket pages.
/// Suggested migration path: replace with Riverpod Notifier in this file.
class TicketController extends ChangeNotifier {
  TicketState _state = const TicketState();

  TicketState get state => _state;

  void setLoading(bool isLoading) {
    _state = _state.copyWith(isLoading: isLoading);
    notifyListeners();
  }

  void selectTicket(String id) {
    _state = _state.copyWith(selectedTicketId: id);
    notifyListeners();
  }
}
