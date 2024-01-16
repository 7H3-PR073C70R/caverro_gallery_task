import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    String? id,
    String? author,
    int? width,
    int? height,
    String? url,
    @JsonKey(name: 'download_url') String? downloadUrl,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
