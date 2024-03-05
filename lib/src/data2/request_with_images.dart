
import 'package:json_annotation/json_annotation.dart';

part 'request_with_images.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestWithImages {
   String? model;
  @JsonKey(name: 'max_tokens')
   int? maxTokens;
   List<MessagesWithImages>? messages;

   RequestWithImages({
    this.model,
    this.maxTokens,
    this.messages,
  });

  factory RequestWithImages.fromJson(Map<String, dynamic> json) =>
      _$RequestWithImagesFromJson(json);

  Map<String, dynamic> toJson() => _$RequestWithImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MessagesWithImages {
  final String? role;
  final List<ContentWithImages>? content;

  const MessagesWithImages({
    this.role,
    this.content,
  });

  factory MessagesWithImages.fromJson(Map<String, dynamic> json) =>
      _$MessagesWithImagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesWithImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ContentWithImages {
  final String? type;
  final Source? source;

  const ContentWithImages({
    this.type,
    this.source,
  });

  factory ContentWithImages.fromJson(Map<String, dynamic> json) =>
      _$ContentWithImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ContentWithImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Source {
  final String? type;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  final List<int>? data;

  const Source({
    this.type,
    this.mediaType,
    this.data,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
