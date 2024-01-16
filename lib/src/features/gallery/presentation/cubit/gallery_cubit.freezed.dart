// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryState {
  bool get isAtEnd => throw _privateConstructorUsedError;
  ViewState get viewState => throw _privateConstructorUsedError;
  List<ImageModel> get images => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAtEnd, ViewState viewState,
            List<ImageModel> images, int currentIndex, String? errorMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAtEnd, ViewState viewState,
            List<ImageModel> images, int currentIndex, String? errorMessage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAtEnd, ViewState viewState, List<ImageModel> images,
            int currentIndex, String? errorMessage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryStateCopyWith<GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
  @useResult
  $Res call(
      {bool isAtEnd,
      ViewState viewState,
      List<ImageModel> images,
      int currentIndex,
      String? errorMessage});
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAtEnd = null,
    Object? viewState = null,
    Object? images = null,
    Object? currentIndex = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isAtEnd: null == isAtEnd
          ? _value.isAtEnd
          : isAtEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      viewState: null == viewState
          ? _value.viewState
          : viewState // ignore: cast_nullable_to_non_nullable
              as ViewState,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GalleryStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAtEnd,
      ViewState viewState,
      List<ImageModel> images,
      int currentIndex,
      String? errorMessage});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAtEnd = null,
    Object? viewState = null,
    Object? images = null,
    Object? currentIndex = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$InitialImpl(
      isAtEnd: null == isAtEnd
          ? _value.isAtEnd
          : isAtEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      viewState: null == viewState
          ? _value.viewState
          : viewState // ignore: cast_nullable_to_non_nullable
              as ViewState,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isAtEnd = false,
      this.viewState = ViewState.idle,
      final List<ImageModel> images = const [],
      this.currentIndex = 1,
      this.errorMessage})
      : _images = images;

  @override
  @JsonKey()
  final bool isAtEnd;
  @override
  @JsonKey()
  final ViewState viewState;
  final List<ImageModel> _images;
  @override
  @JsonKey()
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final int currentIndex;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GalleryState.initial(isAtEnd: $isAtEnd, viewState: $viewState, images: $images, currentIndex: $currentIndex, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isAtEnd, isAtEnd) || other.isAtEnd == isAtEnd) &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAtEnd, viewState,
      const DeepCollectionEquality().hash(_images), currentIndex, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAtEnd, ViewState viewState,
            List<ImageModel> images, int currentIndex, String? errorMessage)
        initial,
  }) {
    return initial(isAtEnd, viewState, images, currentIndex, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAtEnd, ViewState viewState,
            List<ImageModel> images, int currentIndex, String? errorMessage)?
        initial,
  }) {
    return initial?.call(
        isAtEnd, viewState, images, currentIndex, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAtEnd, ViewState viewState, List<ImageModel> images,
            int currentIndex, String? errorMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isAtEnd, viewState, images, currentIndex, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GalleryState {
  const factory _Initial(
      {final bool isAtEnd,
      final ViewState viewState,
      final List<ImageModel> images,
      final int currentIndex,
      final String? errorMessage}) = _$InitialImpl;

  @override
  bool get isAtEnd;
  @override
  ViewState get viewState;
  @override
  List<ImageModel> get images;
  @override
  int get currentIndex;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
