// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  _LocationState call(
      {bool serviceEnabled = false,
      LocationPermission? permission,
      String location = "no data"}) {
    return _LocationState(
      serviceEnabled: serviceEnabled,
      permission: permission,
      location: location,
    );
  }
}

/// @nodoc
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
  bool get serviceEnabled => throw _privateConstructorUsedError;
  LocationPermission? get permission => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
  $Res call(
      {bool serviceEnabled, LocationPermission? permission, String location});
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;

  @override
  $Res call({
    Object? serviceEnabled = freezed,
    Object? permission = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      serviceEnabled: serviceEnabled == freezed
          ? _value.serviceEnabled
          : serviceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as LocationPermission?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LocationStateCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$LocationStateCopyWith(
          _LocationState value, $Res Function(_LocationState) then) =
      __$LocationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool serviceEnabled, LocationPermission? permission, String location});
}

/// @nodoc
class __$LocationStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements _$LocationStateCopyWith<$Res> {
  __$LocationStateCopyWithImpl(
      _LocationState _value, $Res Function(_LocationState) _then)
      : super(_value, (v) => _then(v as _LocationState));

  @override
  _LocationState get _value => super._value as _LocationState;

  @override
  $Res call({
    Object? serviceEnabled = freezed,
    Object? permission = freezed,
    Object? location = freezed,
  }) {
    return _then(_LocationState(
      serviceEnabled: serviceEnabled == freezed
          ? _value.serviceEnabled
          : serviceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as LocationPermission?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocationState with DiagnosticableTreeMixin implements _LocationState {
  const _$_LocationState(
      {this.serviceEnabled = false,
      this.permission,
      this.location = "no data"});

  @JsonKey(defaultValue: false)
  @override
  final bool serviceEnabled;
  @override
  final LocationPermission? permission;
  @JsonKey(defaultValue: "no data")
  @override
  final String location;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationState(serviceEnabled: $serviceEnabled, permission: $permission, location: $location)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationState'))
      ..add(DiagnosticsProperty('serviceEnabled', serviceEnabled))
      ..add(DiagnosticsProperty('permission', permission))
      ..add(DiagnosticsProperty('location', location));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationState &&
            (identical(other.serviceEnabled, serviceEnabled) ||
                other.serviceEnabled == serviceEnabled) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceEnabled, permission, location);

  @JsonKey(ignore: true)
  @override
  _$LocationStateCopyWith<_LocationState> get copyWith =>
      __$LocationStateCopyWithImpl<_LocationState>(this, _$identity);
}

abstract class _LocationState implements LocationState {
  const factory _LocationState(
      {bool serviceEnabled,
      LocationPermission? permission,
      String location}) = _$_LocationState;

  @override
  bool get serviceEnabled;
  @override
  LocationPermission? get permission;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$LocationStateCopyWith<_LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}
