import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  List<RidePreference> getPastPreferences();
  void addPreference(RidePreference preference);
}
