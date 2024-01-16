import 'package:bloc/bloc.dart';
import 'package:canverro_gallery_task/src/core/enums/view_state.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/usecases/get_images_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_state.dart';
part 'gallery_cubit.freezed.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this._getImagesUseCase) : super(const GalleryState.initial());

  final GetImagesUseCase _getImagesUseCase;

  Future<void> getImages() async {
    if (state.viewState.isProcessing || state.isAtEnd) return;
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _getImagesUseCase(state.currentIndex);
    result.fold(
      (failure) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (images) => emit(
        state.copyWith(
          viewState: ViewState.success,
          currentIndex: state.currentIndex + 1,
          isAtEnd: images.length < 100,
          images: [
            ...state.images,
            ...images,
          ],
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }
}
