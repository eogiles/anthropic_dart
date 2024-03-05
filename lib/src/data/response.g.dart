// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      id: json['id'] as String?,
      type: json['type'] as String?,
      model: json['model'] as String?,
      role: json['role'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      stopReason: json['stop_reason'] as String?,
      stopSequence: json['stop_sequence'],
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'role': instance.role,
      'model': instance.model,
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'stop_reason': instance.stopReason,
      'stop_sequence': instance.stopSequence,
      'usage': instance.usage?.toJson(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      type: json['type'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      inputTokens: json['input_tokens'] as int?,
      outputTokens: json['output_tokens'] as int?,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'input_tokens': instance.inputTokens,
      'output_tokens': instance.outputTokens,
    };
