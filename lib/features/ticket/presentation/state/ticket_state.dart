/// UI state model for ticket pages.
class TicketState {
  const TicketState({this.isLoading = false, this.selectedTicketId});

  final bool isLoading;
  final String? selectedTicketId;

  TicketState copyWith({bool? isLoading, String? selectedTicketId}) {
    return TicketState(
      isLoading: isLoading ?? this.isLoading,
      selectedTicketId: selectedTicketId ?? this.selectedTicketId,
    );
  }
}
