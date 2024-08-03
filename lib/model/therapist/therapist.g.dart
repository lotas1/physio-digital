// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Therapist _$TherapistFromJson(Map<String, dynamic> json) => Therapist(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      education: json['education'] as String?,
      about: json['about'] as String?,
      services:
          (json['services'] as List<dynamic>).map((e) => e as String).toList(),
      availability: (json['availability'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      images: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TherapistToJson(Therapist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'location': instance.location,
      'education': instance.education,
      'about': instance.about,
      'services': instance.services,
      'availability': instance.availability,
      'image': instance.images,
    };
