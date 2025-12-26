import 'package:ellidobra_job_portal_app/app/data/job/post_job/post_job_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_job_response.g.dart';

@JsonSerializable()
class PostJobResponse {
  final bool success;
  final String message;
  final JobData data;

  PostJobResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PostJobResponse.fromJson(Map<String, dynamic> json) =>
      _$PostJobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostJobResponseToJson(this);
}

@JsonSerializable()
class JobData {
  final String id;
  final String posterId;
  final String title;
  final String description;
  final JobLocation location;
  final String address;
  final List<String> fileUrls;
  final double minBudget;
  final double maxBudget;
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

  JobData({
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
  });

  factory JobData.fromJson(Map<String, dynamic> json) =>
      _$JobDataFromJson(json);

  Map<String, dynamic> toJson() => _$JobDataToJson(this);
}
