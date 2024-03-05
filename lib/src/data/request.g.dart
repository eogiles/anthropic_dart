// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      model: json['model'] as String?,
      maxTokens: json['max_tokens'] as int?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'model': instance.model,
      'max_tokens': instance.maxTokens,
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: json['role'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
