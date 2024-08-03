import 'package:json_annotation/json_annotation.dart';
part 'therapist.g.dart';

@JsonSerializable()
class Therapist {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "location")
  String? location;

  @JsonKey(name: "education")
  String? education;

  @JsonKey(name: "about")
  String? about;

  @JsonKey(name: "services")
  List<String> services;

  @JsonKey(name: "availability")
  List<String> availability;

  @JsonKey(name: "image")
  List<String> images;

  Therapist({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.education,
    required this.about,
    required this.services,
    required this.availability,
    required this.images,
  });

  factory Therapist.fromJson(Map<String, dynamic> json) =>
      _$TherapistFromJson(json);
  Map<String, dynamic> toJson() => _$TherapistToJson(this);
}
