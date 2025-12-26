import 'package:json_annotation/json_annotation.dart';

part 'post_job_request.g.dart';

@JsonSerializable()
class PostJobRequest {
  final String title;
  final String description;
  final String category;
  final JobLocation location;
  final String address;
  final List<String> fileUrls;
  final String jobType;
  final double minBudget;
  final double maxBudget;
  final String payCurrency;
  final String payType;
  final String startsAt;
  final String endsAt;
  final bool urgent;

  PostJobRequest({
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.address,
    required this.fileUrls,
    required this.jobType,
    required this.minBudget,
    required this.maxBudget,
    required this.payCurrency,
    required this.payType,
    required this.startsAt,
    required this.endsAt,
    required this.urgent,
  });

  factory PostJobRequest.fromJson(Map<String, dynamic> json) =>
      _$PostJobRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostJobRequestToJson(this);
}

@JsonSerializable()
class JobLocation {
  final String type;
  final List<double> coordinates;

  JobLocation({
    required this.type,
    required this.coordinates,
  });

  factory JobLocation.fromJson(Map<String, dynamic> json) =>
      _$JobLocationFromJson(json);

  Map<String, dynamic> toJson() => _$JobLocationToJson(this);
}
