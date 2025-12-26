// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      stripeAccountId: json['stripeAccountId'] as String?,
      role: json['role'] as String,
      status: json['status'] as String,
      trustScore: (json['trustScore'] as num).toInt(),
      referralCode: json['referralCode'] as String?,
      referralBy: json['referralBy'] as String?,
      deviceTokens: (json['deviceTokens'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      location: json['location'],
      fcmToken: json['fcmToken'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'isEmailVerified': instance.isEmailVerified,
      'stripeAccountId': instance.stripeAccountId,
      'role': instance.role,
      'status': instance.status,
      'trustScore': instance.trustScore,
      'referralCode': instance.referralCode,
      'referralBy': instance.referralBy,
      'deviceTokens': instance.deviceTokens,
      'location': instance.location,
      'fcmToken': instance.fcmToken,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
    };
