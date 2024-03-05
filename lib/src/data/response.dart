import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
  final String? id;
  final String? type;
  final String? role, model;
  final List<Content>? content;
  @JsonKey(name: 'stop_reason')
  final String? stopReason;   //end_turn means it good
  @JsonKey(name: 'stop_sequence')
  final dynamic stopSequence;
  final Usage? usage;

  const Response({
    this.id,
    this.type,
    this.model,
    this.role,
    this.content,
    this.stopReason,
    this.stopSequence,
    this.usage,
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Content {
  final String? type;
  final String? text;

  const Content({
    this.type,
    this.text,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Usage {
  @JsonKey(name: 'input_tokens')
  final int? inputTokens;
  @JsonKey(name: 'output_tokens')
  final int? outputTokens;

  const Usage({
    this.inputTokens,
    this.outputTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) =>
      _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}
