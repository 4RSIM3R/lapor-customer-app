class TicketHistoryModel {
  final int? id;
  final int? ticketId;
  final int? employeeId;
  final String? number;
  final String? title;
  final String? information;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TicketHistoryModel({
    this.id,
    this.ticketId,
    this.employeeId,
    this.number,
    this.title,
    this.information,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TicketHistoryModel.fromJson(Map<String, dynamic> json) => TicketHistoryModel(
        id: json["id"],
        ticketId: json["ticket_id"],
        employeeId: json["employee_id"],
        number: json["number"],
        title: json["title"],
        information: json["information"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}