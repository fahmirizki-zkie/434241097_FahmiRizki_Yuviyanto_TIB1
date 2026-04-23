import '../../domain/entities/ticket_entity.dart';

/// DTO for ticket API payloads.
class TicketModel {
  const TicketModel({
    required this.id,
    required this.title,
    required this.status,
  });

  final String id;
  final String title;
  final String status;

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
    );
  }

  TicketEntity toEntity() {
    return TicketEntity(id: id, title: title, status: status);
  }
}
