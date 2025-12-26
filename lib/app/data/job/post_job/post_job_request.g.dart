// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostJobRequest _$PostJobRequestFromJson(Map<String, dynamic> json) =>
    PostJobRequest(
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      location: JobLocation.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] as String,
      fileUrls: (json['fileUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      jobType: json['jobType'] as String,
      minBudget: (json['minBudget'] as num).toDouble(),
      maxBudget: (json['maxBudget'] as num).toDouble(),
      payCurrency: json['payCurrency'] as String,
      payType: json['payType'] as String,
      startsAt: json['startsAt'] as String,
      endsAt: json['endsAt'] as String,
      urgent: json['urgent'] as bool,
    );

Map<String, dynamic> _$PostJobRequestToJson(PostJobRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'location': instance.location,
      'address': instance.address,
      'fileUrls': instance.fileUrls,
      'jobType': instance.jobType,
      'minBudget': instance.minBudget,
      'maxBudget': instance.maxBudget,
      'payCurrency': instance.payCurrency,
      'payType': instance.payType,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
      'urgent': instance.urgent,
    };

JobLocation _$JobLocationFromJson(Map<String, dynamic> json) => JobLocation(
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$JobLocationToJson(JobLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
