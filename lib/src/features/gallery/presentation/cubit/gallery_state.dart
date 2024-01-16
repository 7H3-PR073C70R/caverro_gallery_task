part of 'gallery_cubit.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial({
    @Default(false) bool isAtEnd,
    @Default(ViewState.idle) ViewState viewState,
    @Default([]) List<ImageModel> images,
    @Default(1) int currentIndex,
    String? errorMessage,
  }) = _Initial;
}
