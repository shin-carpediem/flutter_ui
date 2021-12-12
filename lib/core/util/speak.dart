import 'package:flutter_tts/flutter_tts.dart';

Future<void> speakSlowly(text) async {
  FlutterTts flutterTts = FlutterTts();
  await flutterTts.setLanguage("en-US");
  await flutterTts.setSpeechRate(0.25);
  await flutterTts.setVolume(1.0);
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(text);
}

Future<void> speak(text) async {
  FlutterTts flutterTts = FlutterTts();
  await flutterTts.setLanguage("en-US");
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setVolume(1.0);
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(text);
}

Future<void> stop() async {
  FlutterTts flutterTts = FlutterTts();
  await flutterTts.stop();
}
