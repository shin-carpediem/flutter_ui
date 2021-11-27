// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mypage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyPageStateTearOff {
  const _$MyPageStateTearOff();

  _MyPageState call(
      {String? name, String? email, String? desc, bool isLoading = false}) {
    return _MyPageState(
      name: name,
      email: email,
      desc: desc,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $MyPageState = _$MyPageStateTearOff();

/// @nodoc
mixin _$MyPageState {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
          MyPageState value, $Res Function(MyPageState) then) =
      _$MyPageStateCopyWithImpl<$Res>;
  $Res call({String? name, String? email, String? desc, bool isLoading});
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res> implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  final MyPageState _value;
  // ignore: unused_field
  final $Res Function(MyPageState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? desc = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MyPageStateCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$MyPageStateCopyWith(
          _MyPageState value, $Res Function(_MyPageState) then) =
      __$MyPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? email, String? desc, bool isLoading});
}

/// @nodoc
class __$MyPageStateCopyWithImpl<$Res> extends _$MyPageStateCopyWithImpl<$Res>
    implements _$MyPageStateCopyWith<$Res> {
  __$MyPageStateCopyWithImpl(
      _MyPageState _value, $Res Function(_MyPageState) _then)
      : super(_value, (v) => _then(v as _MyPageState));

  @override
  _MyPageState get _value => super._value as _MyPageState;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? desc = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_MyPageState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MyPageState with DiagnosticableTreeMixin implements _MyPageState {
  const _$_MyPageState(
      {this.name, this.email, this.desc, this.isLoading = false});

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? desc;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyPageState(name: $name, email: $email, desc: $desc, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyPageState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyPageState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, desc, isLoading);

  @JsonKey(ignore: true)
  @override
  _$MyPageStateCopyWith<_MyPageState> get copyWith =>
      __$MyPageStateCopyWithImpl<_MyPageState>(this, _$identity);
}

abstract class _MyPageState implements MyPageState {
  const factory _MyPageState(
      {String? name,
      String? email,
      String? desc,
      bool isLoading}) = _$_MyPageState;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get desc;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$MyPageStateCopyWith<_MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
