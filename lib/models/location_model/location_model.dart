import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_model.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    @Default(false) bool serviceEnabled,
    LocationPermission? permission,
    @Default("no data") String location,
  }) = _LocationState;
}
