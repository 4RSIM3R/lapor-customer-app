class UnitModel {
  final int? id;
  final String? identifier;
  final String? name;
  final String? description;
  final String? specification;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? photo;

  UnitModel({
    this.id,
    this.identifier,
    this.name,
    this.description,
    this.specification,
    this.createdAt,
    this.updatedAt,
    this.photo,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        id: json["id"],
        identifier: json["identifier"],
        name: json["name"],
        description: json["description"],
        specification: json["specification"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        photo: json["photo"] == null ? [] : List<dynamic>.from(json["photo"]!.map((x) => x)),
      );
}
