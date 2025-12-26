import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

/// A generic API response wrapper with optional status code.
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final String? message;

  @JsonKey(name: 'data')
  final T? data;

  /// Optional HTTP status code (e.g., 200, 404, 500)
  /// Useful for distinguishing between different error types.
  final int? statusCode;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}