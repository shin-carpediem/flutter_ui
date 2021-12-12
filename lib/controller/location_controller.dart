import 'package:geolocator/geolocator.dart';
import 'package:flutter_ui/models/location_model/location_model.dart';
import 'package:state_notifier/state_notifier.dart';

class LocationController extends StateNotifier<LocationState> {
  LocationController() : super(const LocationState());
  String? location;

  Future<void> getLocation() async {
    // 現在の位置を返す
    // TODO: iOS、Android共にうまくいかない
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      state = state.copyWith(location: position.toString());
    } catch (e) {
      throw "You have denied providing your location.";
    }
  }
}
