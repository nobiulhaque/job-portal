import 'package:json_annotation/json_annotation.dart';

part 'job_response.g.dart';



@JsonSerializable(explicitToJson: true)
class JobResponse {
  final bool success;
  final String message;

  @JsonKey(name: 'data')  // ← This is the key fix!
  final List<Job> jobs;

  JobResponse({
    required this.success,
    required this.message,
    required this.jobs,
  });

  factory JobResponse.fromJson(Map<String, dynamic> json) =>
      _$JobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Job {
  final String id;
  final String posterId;
  final String title;
  final String description;
  final Location location;
  final String address;
  final List<String> fileUrls;
  final int minBudget;
  final int maxBudget;
  final String payCurrency;
  final String payType;
  final String jobType;
  final DateTime startsAt;
  final DateTime endsAt;
  final bool urgent;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String category;
  final Poster poster;
  final List<dynamic> bookings;

  Job({
    required this.id,
    required this.posterId,
    required this.title,
    required this.description,
    required this.location,
    required this.address,
    required this.fileUrls,
    required this.minBudget,
    required this.maxBudget,
    required this.payCurrency,
    required this.payType,
    required this.jobType,
    required this.startsAt,
    required this.endsAt,
    required this.urgent,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.poster,
    required this.bookings,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}

@JsonSerializable()
class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Poster {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final bool isEmailVerified;
  final String? stripeAccountId;
  final String role;
  final String status;
  final int trustScore;
  final String? referralCode;
  final String? referralBy;
  final List<dynamic> deviceTokens;
  final Location? location;
  final String? fcmToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastLoginAt;

  Poster({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
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

  factory Poster.fromJson(Map<String, dynamic> json) => _$PosterFromJson(json);
  Map<String, dynamic> toJson() => _$PosterToJson(this);
}
