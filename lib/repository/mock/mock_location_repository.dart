import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/location_repository.dart';

class MockLocationRepository extends LocationRepository {
  final List<Location> _locations = fakeLocations;

  @override
  void addLocation(Location location) {
    _locations.add(location);
  }

  @override
  List<Location> getLocations() {
    return _locations;
  }
}
