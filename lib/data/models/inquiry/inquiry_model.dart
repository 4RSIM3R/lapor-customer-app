import 'package:next_starter/data/models/site/site_model.dart';

class InquiryModel {
  final int? id;
  final int? customerId;
  final int? siteId;
  final String? title;
  final String? information;
  final String? status;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? photo;
  final SiteModel? site;

  InquiryModel({
    this.id,
    this.customerId,
    this.siteId,
    this.title,
    this.information,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.site,
  });

  factory InquiryModel.fromJson(Map<String, dynamic> json) => InquiryModel(
        id: json["id"],
        customerId: json["customer_id"],
        siteId: json["site_id"],
        title: json["title"],
        information: json["information"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        photo: json["photo"] == null ? [] : List<dynamic>.from(json["photo"]!.map((x) => x)),
        site: json["site"] == null ? null : SiteModel.fromJson(json["site"]),
      );
}
