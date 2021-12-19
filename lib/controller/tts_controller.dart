import 'package:flutter_ui/models/tts_model/tts_model.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:state_notifier/state_notifier.dart';

class TtsController extends StateNotifier<TtsState> {
  TtsController() : super(const TtsState());

  stt.SpeechToText speechToText = stt.SpeechToText();

  Future<void> speak() async {
    bool available = await speechToText.initialize();
    if (available) {
      // TODO: 音声を取得してくれない
      await speechToText.listen(onResult: (SpeechRecognitionResult result) {
        state =
            state.copyWith(lastWords: result.recognizedWords, isListen: true);
      });
      state = state.copyWith(isListen: true);
    } else {
      throw "You has denied the use of speech recognition.";
    }
  }

  Future<void> stop() async {
    await speechToText.stop();
    state = state.copyWith(isListen: false);
  }
}
