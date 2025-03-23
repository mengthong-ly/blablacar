import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/location_repository.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static LocationsService? _locationsService;

  static LocationsService get instance {
    if (_locationsService == null) {
      throw Exception('Location service have not been initialize yet');
    }
    return _locationsService!;
  }

  final LocationRepository locationRepository;

  LocationsService._internal(this.locationRepository);

  static void initialize(LocationRepository locationRepo) {
    if (_locationsService == null) {
      _locationsService = LocationsService._internal(locationRepo);
    } else {
      throw Exception("Location service is already init");
    }
  }

  List<Location> getLocation() {
    return locationRepository.getLocations();
  }

  void addLocation(Location location) {
    return locationRepository.addLocation(location);
  }

  

  // static const List<Location> availableLocations =
  //     fakeLocations; // TODO for now fake data
}
