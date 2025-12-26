import 'package:json_annotation/json_annotation.dart';

part 'otp_verify_request.g.dart';

@JsonSerializable()
class OtpVerifyRequest {
  final String email;
  final int otp;

  OtpVerifyRequest({
    required this.email,
    required this.otp,
  });

  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerifyRequestToJson(this);
}
