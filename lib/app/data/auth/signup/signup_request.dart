import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String role; // e.g., "EMPLOYER" or "WORKER"

  SignupRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}