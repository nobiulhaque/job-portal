import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String id;
  final String name;
  final String email;
  final String phone;
  final bool isEmailVerified;

  @JsonKey(name: 'stripeAccountId')
  final String? stripeAccountId;

  final String role;
  final String status;
  final int trustScore;

  @JsonKey(name: 'referralCode')
  final String? referralCode;

  @JsonKey(name: 'referralBy')
  final String? referralBy;

  final List<String> deviceTokens;

  final dynamic location; // can be null or object

  @JsonKey(name: 'fcmToken')
  final String? fcmToken;

  final DateTime createdAt;
  final DateTime updatedAt;

  @JsonKey(name: 'lastLoginAt')
  final DateTime? lastLoginAt;

  SignupResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isEmailVerified,
    this.stripeAccountId,
    required this.role,
    required this.status,
    required this.trustScore,
    this.referralCode,
    this.referralBy,
    required this.deviceTokens,
    this.location,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
    this.lastLoginAt,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}