class EmployeeModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EmployeeModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );
}
