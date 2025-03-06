import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

abstract class RideRepository {
  List<Ride> getRide(RidePreference ridepref, RidesFilter filter);
  void addRide(Ride ride);
}
