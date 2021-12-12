import 'package:flutter_ui/models/tts_model/tts_model.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:state_notifier/state_notifier.dart';

class TtsController extends StateNotifier<TtsState> {
  TtsController() : super(const TtsState());

  stt.SpeechToText speech = stt.SpeechToText();

  Future<void> speak() async {
    // if (state.isListen) {
    bool available = await speech.initialize(
      onStatus: statusListener,
      onError: errorListener,
    );
    if (available) {
      speech.listen(onResult: resultListener);
      print("listen");
    } else {
      throw "You has denied the use of speech recognition.";
    }
    // } else {
    //   state = state.copyWith(isListen: false);
    //   print("false");
    // }
  }

  Future<void> stop() async {
    speech.stop();
    print("stop");
  }

  void resultListener(SpeechRecognitionResult value) {
    state = state.copyWith(lastWords: value.recognizedWords.toString());
    print("result");
  }

  void errorListener(SpeechRecognitionError e) {
    state = state.copyWith(lastError: '${e.errorMsg} - ${e.permanent}');
  }

  void statusListener(String value) {
    state = state.copyWith(lastStatus: value.toString());
    print("status");
  }
}
