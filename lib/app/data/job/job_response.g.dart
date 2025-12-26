// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResponse _$JobResponseFromJson(Map<String, dynamic> json) => JobResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  jobs: (json['data'] as List<dynamic>)
      .map((e) => Job.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$JobResponseToJson(JobResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.jobs.map((e) => e.toJson()).toList(),
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
  id: json['id'] as String,
  posterId: json['posterId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  address: json['address'] as String,
  fileUrls: (json['fileUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  minBudget: (json['minBudget'] as num).toInt(),
  maxBudget: (json['maxBudget'] as num).toInt(),
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
  poster: Poster.fromJson(json['poster'] as Map<String, dynamic>),
  bookings: json['bookings'] as List<dynamic>,
);

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
  'id': instance.id,
  'posterId': instance.posterId,
  'title': instance.title,
  'description': instance.description,
  'location': instance.location.toJson(),
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
  'poster': instance.poster.toJson(),
  'bookings': instance.bookings,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'type': instance.type,
  'coordinates': instance.coordinates,
};

Poster _$PosterFromJson(Map<String, dynamic> json) => Poster(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  password: json['password'] as String,
  isEmailVerified: json['isEmailVerified'] as bool,
  stripeAccountId: json['stripeAccountId'] as String?,
  role: json['role'] as String,
  status: json['status'] as String,
  trustScore: (json['trustScore'] as num).toInt(),
  referralCode: json['referralCode'] as String?,
  referralBy: json['referralBy'] as String?,
  deviceTokens: json['deviceTokens'] as List<dynamic>,
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  fcmToken: json['fcmToken'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$PosterToJson(Poster instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'password': instance.password,
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
