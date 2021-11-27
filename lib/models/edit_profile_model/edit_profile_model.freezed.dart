// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditProfileStateTearOff {
  const _$EditProfileStateTearOff();

  _EditProfileState call({String? name, String? desc}) {
    return _EditProfileState(
      name: name,
      desc: desc,
    );
  }
}

/// @nodoc
const $EditProfileState = _$EditProfileStateTearOff();

/// @nodoc
mixin _$EditProfileState {
  String? get name => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res>;
  $Res call({String? name, String? desc});
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  final EditProfileState _value;
  // ignore: unused_field
  final $Res Function(EditProfileState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(
          _EditProfileState value, $Res Function(_EditProfileState) then) =
      __$EditProfileStateCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? desc});
}

/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(
      _EditProfileState _value, $Res Function(_EditProfileState) _then)
      : super(_value, (v) => _then(v as _EditProfileState));

  @override
  _EditProfileState get _value => super._value as _EditProfileState;

  @override
  $Res call({
    Object? name = freezed,
    Object? desc = freezed,
  }) {
    return _then(_EditProfileState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditProfileState
    with DiagnosticableTreeMixin
    implements _EditProfileState {
  const _$_EditProfileState({this.name, this.desc});

  @override
  final String? name;
  @override
  final String? desc;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditProfileState(name: $name, desc: $desc)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditProfileState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('desc', desc));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditProfileState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, desc);

  @JsonKey(ignore: true)
  @override
  _$EditProfileStateCopyWith<_EditProfileState> get copyWith =>
      __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState({String? name, String? desc}) =
      _$_EditProfileState;

  @override
  String? get name;
  @override
  String? get desc;
  @override
  @JsonKey(ignore: true)
  _$EditProfileStateCopyWith<_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
