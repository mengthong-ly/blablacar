import 'package:week_3_blabla_project/repository/reide_preference_repository.dart';

import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///
class RidePrefService {
  static RidePrefService? _instance;

  static RidePrefService get instance {
    if (_instance == null) {
      throw Exception('RidePreferenceService is not initialize');
    }
    return _instance!;
  }

  final RidePreferenceRepository repository;

  RidePreference? _currentPreference;

  RidePreference? get currentRidePreference {
    print('Get current preference $_currentPreference');
    return _currentPreference;
  }

  RidePrefService._internal(this.repository);

  static void initialize(RidePreferenceRepository repository) {
    if (_instance == null) {
      _instance = RidePrefService._internal(repository);
    } else {
      throw Exception("RidePreference service is already init");
    }
  }

  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
    print('Set current preference to $_currentPreference');
  }

  //
  // past preferences
  //
  List<RidePreference> getPastPreference() {
    return repository.getPastPreferences();
  }

  // 
  // 
  // 
  void addPreference(RidePreference preference) {
    return repository.addPreference(preference);
  }
}
