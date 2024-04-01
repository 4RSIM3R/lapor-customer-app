import 'package:next_starter/data/models/site/unit_model.dart';

class SiteDetailModel {
  final int? id;
  final int? companyId;
  final int? customerId;
  final String? name;
  final String? address;
  final String? latitude;
  final String? longitude;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<UnitModel>? units;

  SiteDetailModel({
    this.id,
    this.companyId,
    this.customerId,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.units,
  });

  factory SiteDetailModel.fromJson(Map<String, dynamic> json) => SiteDetailModel(
        id: json["id"],
        companyId: json["company_id"],
        customerId: json["customer_id"],
        name: json["name"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        units: json["units"] == null ? [] : List<UnitModel>.from(json["units"]!.map((x) => UnitModel.fromJson(x))),
      );
}
