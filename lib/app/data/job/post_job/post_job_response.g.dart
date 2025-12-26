// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostJobResponse _$PostJobResponseFromJson(Map<String, dynamic> json) =>
    PostJobResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: JobData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostJobResponseToJson(PostJobResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

JobData _$JobDataFromJson(Map<String, dynamic> json) => JobData(
  id: json['id'] as String,
  posterId: json['posterId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  location: JobLocation.fromJson(json['location'] as Map<String, dynamic>),
  address: json['address'] as String,
  fileUrls: (json['fileUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  minBudget: (json['minBudget'] as num).toDouble(),
  maxBudget: (json['maxBudget'] as num).toDouble(),
  payCurrency: json['payCurrency'] as String,
  payType: json['payType'] as String,
  jobType: json['jobType'] as String,
  startsAt: DateTime.parse(json['startsAt'] as String),
  endsAt: DateTime.parse(json['endsAt'] as String),
  urgent: json['urgent'] as bool,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  category: json['category'] as String,
);

Map<String, dynamic> _$JobDataToJson(JobData instance) => <String, dynamic>{
  'id': instance.id,
  'posterId': instance.posterId,
  'title': instance.title,
  'description': instance.description,
  'location': instance.location,
  'address': instance.address,
  'fileUrls': instance.fileUrls,
  'minBudget': instance.minBudget,
  'maxBudget': instance.maxBudget,
  'payCurrency': instance.payCurrency,
  'payType': instance.payType,
  'jobType': instance.jobType,
  'startsAt': instance.startsAt.toIso8601String(),
  'endsAt': instance.endsAt.toIso8601String(),
  'urgent': instance.urgent,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'category': instance.category,
};
