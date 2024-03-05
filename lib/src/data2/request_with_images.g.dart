// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_with_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestWithImages _$RequestWithImagesFromJson(Map<String, dynamic> json) =>
    RequestWithImages(
      model: json['model'] as String?,
      maxTokens: json['max_tokens'] as int?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessagesWithImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestWithImagesToJson(RequestWithImages instance) =>
    <String, dynamic>{
      'model': instance.model,
      'max_tokens': instance.maxTokens,
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
    };

MessagesWithImages _$MessagesWithImagesFromJson(Map<String, dynamic> json) =>
    MessagesWithImages(
      role: json['role'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ContentWithImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagesWithImagesToJson(MessagesWithImages instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content?.map((e) => e.toJson()).toList(),
    };

ContentWithImages _$ContentWithImagesFromJson(Map<String, dynamic> json) =>
    ContentWithImages(
      type: json['type'] as String?,
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentWithImagesToJson(ContentWithImages instance) =>
    <String, dynamic>{
      'type': instance.type,
      'source': instance.source?.toJson(),
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      type: json['type'] as String?,
      mediaType: json['media_type'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'type': instance.type,
      'media_type': instance.mediaType,
      'data': instance.data,
    };
