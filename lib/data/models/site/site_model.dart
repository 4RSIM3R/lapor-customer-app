class SiteModel {
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

  SiteModel({
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
  });

  factory SiteModel.fromJson(Map<String, dynamic> json) => SiteModel(
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
      );
}