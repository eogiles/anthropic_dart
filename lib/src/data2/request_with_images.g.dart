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
          ?.map((e) => MessageWithImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestWithImagesToJson(RequestWithImages instance) =>
    <String, dynamic>{
      'model': instance.model,
      'max_tokens': instance.maxTokens,
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
    };

MessageWithImages _$MessageWithImagesFromJson(Map<String, dynamic> json) =>
    MessageWithImages(
      role: json['role'] as String?,
      content: json['content'] as List<dynamic>?,
    );

Map<String, dynamic> _$MessageWithImagesToJson(MessageWithImages instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

ContentWithImage _$ContentWithImageFromJson(Map<String, dynamic> json) =>
    ContentWithImage(
      type: json['type'] as String?,
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentWithImageToJson(ContentWithImage instance) =>
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
