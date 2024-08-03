// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) => Clinic(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      availability: (json['availability'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      services:
          (json['services'] as List<dynamic>).map((e) => e as String).toList(),
      images: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'availability': instance.availability,
      'services': instance.services,
      'image': instance.images,
    };
