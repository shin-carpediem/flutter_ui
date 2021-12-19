// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TtsStateTearOff {
  const _$TtsStateTearOff();

  _TtsState call(
      {String lastWords = "",
      String lastError = '',
      String lastStatus = '',
      bool isLoading = false,
      bool isListen = false,
      bool available = false}) {
    return _TtsState(
      lastWords: lastWords,
      lastError: lastError,
      lastStatus: lastStatus,
      isLoading: isLoading,
      isListen: isListen,
      available: available,
    );
  }
}

/// @nodoc
const $TtsState = _$TtsStateTearOff();

/// @nodoc
mixin _$TtsState {
  String get lastWords => throw _privateConstructorUsedError;
  String get lastError => throw _privateConstructorUsedError;
  String get lastStatus => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isListen => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TtsStateCopyWith<TtsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TtsStateCopyWith<$Res> {
  factory $TtsStateCopyWith(TtsState value, $Res Function(TtsState) then) =
      _$TtsStateCopyWithImpl<$Res>;
  $Res call(
      {String lastWords,
      String lastError,
      String lastStatus,
      bool isLoading,
      bool isListen,
      bool available});
}

/// @nodoc
class _$TtsStateCopyWithImpl<$Res> implements $TtsStateCopyWith<$Res> {
  _$TtsStateCopyWithImpl(this._value, this._then);

  final TtsState _value;
  // ignore: unused_field
  final $Res Function(TtsState) _then;

  @override
  $Res call({
    Object? lastWords = freezed,
    Object? lastError = freezed,
    Object? lastStatus = freezed,
    Object? isLoading = freezed,
    Object? isListen = freezed,
    Object? available = freezed,
  }) {
    return _then(_value.copyWith(
      lastWords: lastWords == freezed
          ? _value.lastWords
          : lastWords // ignore: cast_nullable_to_non_nullable
              as String,
      lastError: lastError == freezed
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isListen: isListen == freezed
          ? _value.isListen
          : isListen // ignore: cast_nullable_to_non_nullable
              as bool,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TtsStateCopyWith<$Res> implements $TtsStateCopyWith<$Res> {
  factory _$TtsStateCopyWith(_TtsState value, $Res Function(_TtsState) then) =
      __$TtsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String lastWords,
      String lastError,
      String lastStatus,
      bool isLoading,
      bool isListen,
      bool available});
}

/// @nodoc
class __$TtsStateCopyWithImpl<$Res> extends _$TtsStateCopyWithImpl<$Res>
    implements _$TtsStateCopyWith<$Res> {
  __$TtsStateCopyWithImpl(_TtsState _value, $Res Function(_TtsState) _then)
      : super(_value, (v) => _then(v as _TtsState));

  @override
  _TtsState get _value => super._value as _TtsState;

  @override
  $Res call({
    Object? lastWords = freezed,
    Object? lastError = freezed,
    Object? lastStatus = freezed,
    Object? isLoading = freezed,
    Object? isListen = freezed,
    Object? available = freezed,
  }) {
    return _then(_TtsState(
      lastWords: lastWords == freezed
          ? _value.lastWords
          : lastWords // ignore: cast_nullable_to_non_nullable
              as String,
      lastError: lastError == freezed
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isListen: isListen == freezed
          ? _value.isListen
          : isListen // ignore: cast_nullable_to_non_nullable
              as bool,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TtsState with DiagnosticableTreeMixin implements _TtsState {
  const _$_TtsState(
      {this.lastWords = "",
      this.lastError = '',
      this.lastStatus = '',
      this.isLoading = false,
      this.isListen = false,
      this.available = false});

  @JsonKey(defaultValue: "")
  @override
  final String lastWords;
  @JsonKey(defaultValue: '')
  @override
  final String lastError;
  @JsonKey(defaultValue: '')
  @override
  final String lastStatus;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isListen;
  @JsonKey(defaultValue: false)
  @override
  final bool available;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TtsState(lastWords: $lastWords, lastError: $lastError, lastStatus: $lastStatus, isLoading: $isLoading, isListen: $isListen, available: $available)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TtsState'))
      ..add(DiagnosticsProperty('lastWords', lastWords))
      ..add(DiagnosticsProperty('lastError', lastError))
      ..add(DiagnosticsProperty('lastStatus', lastStatus))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isListen', isListen))
      ..add(DiagnosticsProperty('available', available));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TtsState &&
            (identical(other.lastWords, lastWords) ||
                other.lastWords == lastWords) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError) &&
            (identical(other.lastStatus, lastStatus) ||
                other.lastStatus == lastStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isListen, isListen) ||
                other.isListen == isListen) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastWords, lastError, lastStatus,
      isLoading, isListen, available);

  @JsonKey(ignore: true)
  @override
  _$TtsStateCopyWith<_TtsState> get copyWith =>
      __$TtsStateCopyWithImpl<_TtsState>(this, _$identity);
}

abstract class _TtsState implements TtsState {
  const factory _TtsState(
      {String lastWords,
      String lastError,
      String lastStatus,
      bool isLoading,
      bool isListen,
      bool available}) = _$_TtsState;

  @override
  String get lastWords;
  @override
  String get lastError;
  @override
  String get lastStatus;
  @override
  bool get isLoading;
  @override
  bool get isListen;
  @override
  bool get available;
  @override
  @JsonKey(ignore: true)
  _$TtsStateCopyWith<_TtsState> get copyWith =>
      throw _privateConstructorUsedError;
}
