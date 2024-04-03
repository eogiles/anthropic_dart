
import 'package:json_annotation/json_annotation.dart';

part 'request_with_images.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestWithImages {
   String? model;
  @JsonKey(name: 'max_tokens')
   int? maxTokens;
   List<MessageWithImages>? messages;

   RequestWithImages({
    required this.model,
     required this.maxTokens,
     required this.messages,
  });

  factory RequestWithImages.fromJson(Map<String, dynamic> json) =>
      _$RequestWithImagesFromJson(json);

  Map<String, dynamic> toJson() => _$RequestWithImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MessageWithImages {
  final String? role;
  final List<dynamic>? content;

  const MessageWithImages({
    required this.role,
    required this.content,
  });

  factory MessageWithImages.fromJson(Map<String, dynamic> json) =>
      _$MessageWithImagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessageWithImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ContentWithImage {
   String? type;
   Source? source;

   ContentWithImage({
    required this.type,
    required this.source,
  });

  factory ContentWithImage.fromJson(Map<String, dynamic> json) =>
      _$ContentWithImageFromJson(json);

  Map<String, dynamic> toJson() => _$ContentWithImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Source {
   String? type;
  @JsonKey(name: 'media_type')
   String? mediaType;
   List<int>? data;

   Source({
     required this.type,
     required this.mediaType,
     required this.data,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
