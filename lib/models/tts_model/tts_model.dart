import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tts_model.freezed.dart';

@freezed
class TtsState with _$TtsState {
  const factory TtsState({
    @Default("") String lastWords,
    @Default('') String lastError,
    @Default('') String lastStatus,
    @Default(false) bool isLoading,
    @Default(false) bool isListen,
  }) = _TtsState;
}
