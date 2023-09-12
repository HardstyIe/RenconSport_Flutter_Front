// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth0_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Auth0State {
  bool get isBusy => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Auth0StateCopyWith<Auth0State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0StateCopyWith<$Res> {
  factory $Auth0StateCopyWith(
          Auth0State value, $Res Function(Auth0State) then) =
      _$Auth0StateCopyWithImpl<$Res, Auth0State>;
  @useResult
  $Res call(
      {bool isBusy,
      bool isLoggedIn,
      Map<dynamic, dynamic>? data,
      String? errorMessage});
}

/// @nodoc
class _$Auth0StateCopyWithImpl<$Res, $Val extends Auth0State>
    implements $Auth0StateCopyWith<$Res> {
  _$Auth0StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? isLoggedIn = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Auth0StateCopyWith<$Res>
    implements $Auth0StateCopyWith<$Res> {
  factory _$$_Auth0StateCopyWith(
          _$_Auth0State value, $Res Function(_$_Auth0State) then) =
      __$$_Auth0StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy,
      bool isLoggedIn,
      Map<dynamic, dynamic>? data,
      String? errorMessage});
}

/// @nodoc
class __$$_Auth0StateCopyWithImpl<$Res>
    extends _$Auth0StateCopyWithImpl<$Res, _$_Auth0State>
    implements _$$_Auth0StateCopyWith<$Res> {
  __$$_Auth0StateCopyWithImpl(
      _$_Auth0State _value, $Res Function(_$_Auth0State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? isLoggedIn = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_Auth0State(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Auth0State implements _Auth0State {
  const _$_Auth0State(
      {this.isBusy = false,
      this.isLoggedIn = false,
      final Map<dynamic, dynamic>? data,
      this.errorMessage})
      : _data = data;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool isLoggedIn;
  final Map<dynamic, dynamic>? _data;
  @override
  Map<dynamic, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Auth0State(isBusy: $isBusy, isLoggedIn: $isLoggedIn, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth0State &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBusy, isLoggedIn,
      const DeepCollectionEquality().hash(_data), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Auth0StateCopyWith<_$_Auth0State> get copyWith =>
      __$$_Auth0StateCopyWithImpl<_$_Auth0State>(this, _$identity);
}

abstract class _Auth0State implements Auth0State {
  const factory _Auth0State(
      {final bool isBusy,
      final bool isLoggedIn,
      final Map<dynamic, dynamic>? data,
      final String? errorMessage}) = _$_Auth0State;

  @override
  bool get isBusy;
  @override
  bool get isLoggedIn;
  @override
  Map<dynamic, dynamic>? get data;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_Auth0StateCopyWith<_$_Auth0State> get copyWith =>
      throw _privateConstructorUsedError;
}
