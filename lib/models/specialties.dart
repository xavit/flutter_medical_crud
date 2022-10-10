// To parse this JSON data, do
//
//     final specialties = specialtiesFromMap(jsonString);

import 'dart:convert';

class Specialties {
  Specialties({
    this.id,
    this.code,
    this.name,
    this.status,
    this.editAt,
    this.createdAt,
    this.createdBy,
    this.description,
    this.isValidated,
    this.validatedAt,
    this.validatedBy,
  });

  int? id;
  String? code;
  String? name;
  String? status;
  DateTime? editAt;
  DateTime? createdAt;
  String? createdBy;
  String? description;
  String? isValidated;
  DateTime? validatedAt;
  dynamic validatedBy;

  factory Specialties.fromJson(String str) =>
      Specialties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Specialties.fromMap(Map<String, dynamic> json) => Specialties(
        id: json["id"] ?? '',
        code: json["code"] ?? '',
        name: json["name"] ?? '',
        status: json["status"] ?? '',
        editAt: DateTime.parse(json["edit_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"] ?? '',
        description: json["description"] ?? '',
        isValidated: json["is_validated"] ?? '',
        validatedAt: DateTime.parse(json["validated_at"]),
        validatedBy: json["validated_by"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "name": name,
        "status": status,
        "edit_at": editAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "created_by": createdBy,
        "description": description,
        "is_validated": isValidated,
        "validated_at": validatedAt!.toIso8601String(),
        "validated_by": validatedBy,
      };
}
