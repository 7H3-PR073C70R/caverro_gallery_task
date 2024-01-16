import 'package:canverro_gallery_task/src/core/enums/view_state.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('gallery state ...', () {
    test('should create a new state with updated values using copyWith', () {
      // Arrange
      const initialState = GalleryState.initial();

      // Act
      final updatedState = initialState.copyWith(
        isAtEnd: true,
        viewState: ViewState.success,
        currentIndex: 10,
        errorMessage: 'New error message',
      );

      // Assert
      expect(updatedState.isAtEnd, true);
      expect(updatedState.viewState, ViewState.success);
      expect(updatedState.currentIndex, 10);
      expect(updatedState.errorMessage, 'New error message');

      // Ensure that the original state is unchanged
      expect(initialState.isAtEnd, false);
      expect(initialState.viewState, ViewState.idle);
      expect(initialState.currentIndex, 1);
      expect(initialState.errorMessage, null);
    });

    test('should create an initial state with default values', () {
      // Arrange
      const initialState = GalleryState.initial();

      // Assert
      expect(initialState.isAtEnd, false);
      expect(initialState.viewState, ViewState.idle);
      expect(initialState.images, <ImageModel>[]);
      expect(initialState.currentIndex, 1);
      expect(initialState.errorMessage, null);
    });

    test('should create an initial state with custom values', () {
      // Arrange
      const customState = GalleryState.initial(
        isAtEnd: true,
        viewState: ViewState.processing,
        images: [ImageModel(id: '1')],
        currentIndex: 5,
        errorMessage: 'Test error message',
      );

      // Assert
      expect(customState.isAtEnd, true);
      expect(customState.viewState, ViewState.processing);
      expect(customState.images, [const ImageModel(id: '1')]);
      expect(customState.currentIndex, 5);
      expect(customState.errorMessage, 'Test error message');
    });

    test('should create an initial state with default values when not provided',
        () {
      // Arrange
      const stateWithoutValues = GalleryState.initial();

      // Assert
      expect(stateWithoutValues.isAtEnd, false);
      expect(stateWithoutValues.viewState, ViewState.idle);
      expect(stateWithoutValues.images, const <ImageModel>[]);
      expect(stateWithoutValues.currentIndex, 1);
      expect(stateWithoutValues.errorMessage, null);
    });

    group('equality test ...', () {
      test('objects with the same values should be equal', () {
        // Arrange
        const state1 = GalleryState.initial(
          isAtEnd: true,
          viewState: ViewState.success,
          currentIndex: 10,
          errorMessage: 'Error 1',
        );

        const state2 = GalleryState.initial(
          isAtEnd: true,
          viewState: ViewState.success,
          currentIndex: 10,
          errorMessage: 'Error 1',
        );

        // Act & Assert
        expect(state1, equals(state2));
      });

      test('objects with different values should not be equal', () {
        // Arrange
        const state1 = GalleryState.initial(
          isAtEnd: true,
          viewState: ViewState.success,
          currentIndex: 10,
          errorMessage: 'Error 1',
        );

        const state2 = GalleryState.initial(
          viewState: ViewState.success,
          currentIndex: 10,
          errorMessage: 'Error 1',
        );

        // Act & Assert
        expect(state1, isNot(equals(state2)));
      });
    });
  });
}
