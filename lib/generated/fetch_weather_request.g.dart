// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of '../fetch_weather_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FetchWeatherRequestImpl _$$FetchWeatherRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FetchWeatherRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$FetchWeatherRequestImpl(
          area: $checkedConvert('area', (v) => v as String),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$FetchWeatherRequestImplToJson(
        _$FetchWeatherRequestImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };
