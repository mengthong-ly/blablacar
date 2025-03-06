import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_repository.dart';

import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///

class RidesService {
  static RidesService? _instance;
  final RideRepository _rideRepository;

  RidesService._privateInstance(this._rideRepository);

  static void initialize(RideRepository rideRepository) {
    if (_instance == null) {
      _instance = RidesService._privateInstance(rideRepository);
    } else {
      throw Exception('');
    }
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception('');
    } else {
      return _instance!;
    }
  }

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  List<Ride> getRidesFor(RidePreference preferences, RidesFilter rideFilter) {
    // For now, just a test
    return _rideRepository
        .getRide(preferences, rideFilter)
        .where((ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival &&
            ride.filter.acceptPet == rideFilter.acceptPet)
        .toList();
  }
}
