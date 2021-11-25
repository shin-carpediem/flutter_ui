// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddCourseStateTearOff {
  const _$AddCourseStateTearOff();

  _AddCourseState call({String? title, String? subtitle, String? logoUrl}) {
    return _AddCourseState(
      title: title,
      subtitle: subtitle,
      logoUrl: logoUrl,
    );
  }
}

/// @nodoc
const $AddCourseState = _$AddCourseStateTearOff();

/// @nodoc
mixin _$AddCourseState {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCourseStateCopyWith<AddCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCourseStateCopyWith<$Res> {
  factory $AddCourseStateCopyWith(
          AddCourseState value, $Res Function(AddCourseState) then) =
      _$AddCourseStateCopyWithImpl<$Res>;
  $Res call({String? title, String? subtitle, String? logoUrl});
}

/// @nodoc
class _$AddCourseStateCopyWithImpl<$Res>
    implements $AddCourseStateCopyWith<$Res> {
  _$AddCourseStateCopyWithImpl(this._value, this._then);

  final AddCourseState _value;
  // ignore: unused_field
  final $Res Function(AddCourseState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddCourseStateCopyWith<$Res>
    implements $AddCourseStateCopyWith<$Res> {
  factory _$AddCourseStateCopyWith(
          _AddCourseState value, $Res Function(_AddCourseState) then) =
      __$AddCourseStateCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? subtitle, String? logoUrl});
}

/// @nodoc
class __$AddCourseStateCopyWithImpl<$Res>
    extends _$AddCourseStateCopyWithImpl<$Res>
    implements _$AddCourseStateCopyWith<$Res> {
  __$AddCourseStateCopyWithImpl(
      _AddCourseState _value, $Res Function(_AddCourseState) _then)
      : super(_value, (v) => _then(v as _AddCourseState));

  @override
  _AddCourseState get _value => super._value as _AddCourseState;

  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_AddCourseState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddCourseState
    with DiagnosticableTreeMixin
    implements _AddCourseState {
  const _$_AddCourseState({this.title, this.subtitle, this.logoUrl});

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? logoUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddCourseState(title: $title, subtitle: $subtitle, logoUrl: $logoUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddCourseState'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('logoUrl', logoUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCourseState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, logoUrl);

  @JsonKey(ignore: true)
  @override
  _$AddCourseStateCopyWith<_AddCourseState> get copyWith =>
      __$AddCourseStateCopyWithImpl<_AddCourseState>(this, _$identity);
}

abstract class _AddCourseState implements AddCourseState {
  const factory _AddCourseState(
      {String? title, String? subtitle, String? logoUrl}) = _$_AddCourseState;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$AddCourseStateCopyWith<_AddCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}
