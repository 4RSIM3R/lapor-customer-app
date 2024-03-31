import 'package:next_starter/data/models/employee/employee_model.dart';
import 'package:next_starter/data/models/site/site_model.dart';
import 'package:next_starter/data/models/ticket/ticket_history_model.dart';

class TicketDetailModel {
  final int? id;
  final int? customerId;
  final int? siteId;
  final int? employeeId;
  final DateTime? date;
  final String? number;
  final String? title;
  final String? information;
  final String? type;
  final String? status;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? photo;
  final SiteModel? site;
  final EmployeeModel? employee;
  final List<TicketHistoryModel>? histories;

  TicketDetailModel({
    this.id,
    this.customerId,
    this.siteId,
    this.employeeId,
    this.date,
    this.number,
    this.title,
    this.information,
    this.type,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.site,
    this.employee,
    this.histories,
  });

  factory TicketDetailModel.fromJson(Map<String, dynamic> json) => TicketDetailModel(
        id: json["id"],
        customerId: json["customer_id"],
        siteId: json["site_id"],
        employeeId: json["employee_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        number: json["number"],
        title: json["title"],
        information: json["information"],
        type: json["type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        photo: json["photo"] == null ? [] : List<dynamic>.from(json["photo"]!.map((x) => x)),
        site: json["site"] == null ? null : SiteModel.fromJson(json["site"]),
        employee: json["employee"] == null ? null : EmployeeModel.fromJson(json["employee"]),
        histories: json["histories"] == null
            ? []
            : List<TicketHistoryModel>.from(
                json["histories"]!.map((x) => TicketHistoryModel.fromJson(x)),
              ),
      );
}
