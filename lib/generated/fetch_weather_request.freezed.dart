// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../fetch_weather_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FetchWeatherRequest _$FetchWeatherRequestFromJson(Map<String, dynamic> json) {
  return _FetchWeatherRequest.fromJson(json);
}

/// @nodoc
mixin _$FetchWeatherRequest {
  String get area => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchWeatherRequestCopyWith<FetchWeatherRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchWeatherRequestCopyWith<$Res> {
  factory $FetchWeatherRequestCopyWith(
          FetchWeatherRequest value, $Res Function(FetchWeatherRequest) then) =
      _$FetchWeatherRequestCopyWithImpl<$Res, FetchWeatherRequest>;
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class _$FetchWeatherRequestCopyWithImpl<$Res, $Val extends FetchWeatherRequest>
    implements $FetchWeatherRequestCopyWith<$Res> {
  _$FetchWeatherRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchWeatherRequestImplCopyWith<$Res>
    implements $FetchWeatherRequestCopyWith<$Res> {
  factory _$$FetchWeatherRequestImplCopyWith(_$FetchWeatherRequestImpl value,
          $Res Function(_$FetchWeatherRequestImpl) then) =
      __$$FetchWeatherRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class __$$FetchWeatherRequestImplCopyWithImpl<$Res>
    extends _$FetchWeatherRequestCopyWithImpl<$Res, _$FetchWeatherRequestImpl>
    implements _$$FetchWeatherRequestImplCopyWith<$Res> {
  __$$FetchWeatherRequestImplCopyWithImpl(_$FetchWeatherRequestImpl _value,
      $Res Function(_$FetchWeatherRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_$FetchWeatherRequestImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchWeatherRequestImpl implements _FetchWeatherRequest {
  const _$FetchWeatherRequestImpl({required this.area, required this.date});

  factory _$FetchWeatherRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchWeatherRequestImplFromJson(json);

  @override
  final String area;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'FetchWeatherRequest(area: $area, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchWeatherRequestImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchWeatherRequestImplCopyWith<_$FetchWeatherRequestImpl> get copyWith =>
      __$$FetchWeatherRequestImplCopyWithImpl<_$FetchWeatherRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchWeatherRequestImplToJson(
      this,
    );
  }
}

abstract class _FetchWeatherRequest implements FetchWeatherRequest {
  const factory _FetchWeatherRequest(
      {required final String area,
      required final DateTime date}) = _$FetchWeatherRequestImpl;

  factory _FetchWeatherRequest.fromJson(Map<String, dynamic> json) =
      _$FetchWeatherRequestImpl.fromJson;

  @override
  String get area;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$FetchWeatherRequestImplCopyWith<_$FetchWeatherRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
