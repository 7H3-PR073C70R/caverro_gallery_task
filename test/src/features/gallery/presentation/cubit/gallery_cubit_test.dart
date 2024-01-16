import 'package:bloc_test/bloc_test.dart';
import 'package:canverro_gallery_task/src/core/enums/view_state.dart';
import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/usecases/get_images_use_case.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetImagesUseCase extends Mock implements GetImagesUseCase {}

void main() {
  late MockGetImagesUseCase mockGetImagesUseCase;

  setUp(() {
    mockGetImagesUseCase = MockGetImagesUseCase();
  });
  group('gallery cubit ...', () {
    blocTest<GalleryCubit, GalleryState>(
      'emits [processing, success] when getImages is called successfully',
      build: () {
        when(() => mockGetImagesUseCase.call(any())).thenAnswer(
          (_) async => const Right([]),
        );
        return GalleryCubit(mockGetImagesUseCase);
      },
      act: (cubit) => cubit.getImages(),
      expect: () => [
        const GalleryState.initial(viewState: ViewState.processing),
        const GalleryState.initial(
          viewState: ViewState.success,
          currentIndex: 2,
          isAtEnd: true,
        ),
        const GalleryState.initial(
          currentIndex: 2,
          isAtEnd: true,
        ),
      ],
    );

    blocTest<GalleryCubit, GalleryState>(
      'emits [processing, error] when getImages encounters an error',
      build: () {
        when(() => mockGetImagesUseCase.call(any())).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'Error')),
        );
        return GalleryCubit(mockGetImagesUseCase);
      },
      act: (cubit) => cubit.getImages(),
      expect: () => [
        const GalleryState.initial(viewState: ViewState.processing),
        const GalleryState.initial(
          viewState: ViewState.error,
          errorMessage: 'Error',
        ),
        const GalleryState.initial(
          errorMessage: 'Error',
        ),
      ],
    );
  });
}
