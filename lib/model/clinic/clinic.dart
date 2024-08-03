import 'package:json_annotation/json_annotation.dart';
part 'clinic.g.dart';

@JsonSerializable()
class Clinic {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "availability")
  List<String> availability;

  @JsonKey(name: "services")
  List<String> services;

  @JsonKey(name: "image")
  List<String> images;

  Clinic({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.description,
    required this.availability,
    required this.services,
    required this.images,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) =>
      _$ClinicFromJson(json);
  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}
