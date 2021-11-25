// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditCourseStateTearOff {
  const _$EditCourseStateTearOff();

  _EditCourseState call({String? title, String? subtitle, String? logoUrl}) {
    return _EditCourseState(
      title: title,
      subtitle: subtitle,
      logoUrl: logoUrl,
    );
  }
}

/// @nodoc
const $EditCourseState = _$EditCourseStateTearOff();

/// @nodoc
mixin _$EditCourseState {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCourseStateCopyWith<EditCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCourseStateCopyWith<$Res> {
  factory $EditCourseStateCopyWith(
          EditCourseState value, $Res Function(EditCourseState) then) =
      _$EditCourseStateCopyWithImpl<$Res>;
  $Res call({String? title, String? subtitle, String? logoUrl});
}

/// @nodoc
class _$EditCourseStateCopyWithImpl<$Res>
    implements $EditCourseStateCopyWith<$Res> {
  _$EditCourseStateCopyWithImpl(this._value, this._then);

  final EditCourseState _value;
  // ignore: unused_field
  final $Res Function(EditCourseState) _then;

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
abstract class _$EditCourseStateCopyWith<$Res>
    implements $EditCourseStateCopyWith<$Res> {
  factory _$EditCourseStateCopyWith(
          _EditCourseState value, $Res Function(_EditCourseState) then) =
      __$EditCourseStateCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? subtitle, String? logoUrl});
}

/// @nodoc
class __$EditCourseStateCopyWithImpl<$Res>
    extends _$EditCourseStateCopyWithImpl<$Res>
    implements _$EditCourseStateCopyWith<$Res> {
  __$EditCourseStateCopyWithImpl(
      _EditCourseState _value, $Res Function(_EditCourseState) _then)
      : super(_value, (v) => _then(v as _EditCourseState));

  @override
  _EditCourseState get _value => super._value as _EditCourseState;

  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_EditCourseState(
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

class _$_EditCourseState
    with DiagnosticableTreeMixin
    implements _EditCourseState {
  const _$_EditCourseState({this.title, this.subtitle, this.logoUrl});

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? logoUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditCourseState(title: $title, subtitle: $subtitle, logoUrl: $logoUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditCourseState'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('logoUrl', logoUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditCourseState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, logoUrl);

  @JsonKey(ignore: true)
  @override
  _$EditCourseStateCopyWith<_EditCourseState> get copyWith =>
      __$EditCourseStateCopyWithImpl<_EditCourseState>(this, _$identity);
}

abstract class _EditCourseState implements EditCourseState {
  const factory _EditCourseState(
      {String? title, String? subtitle, String? logoUrl}) = _$_EditCourseState;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$EditCourseStateCopyWith<_EditCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}
