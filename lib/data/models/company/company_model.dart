class CompanyModel {
  final int? id;
  final String? name;
  final String? businessName;
  final String? address;
  final String? latitude;
  final String? longitude;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CompanyModel({
    this.id,
    this.name,
    this.businessName,
    this.address,
    this.latitude,
    this.longitude,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        name: json["name"],
        businessName: json["business_name"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}