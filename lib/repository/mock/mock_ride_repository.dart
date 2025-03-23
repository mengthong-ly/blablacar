import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/model/user/user.dart';
import 'package:week_3_blabla_project/repository/ride_repository.dart';

class MockRideRepository extends RideRepository {
  final List<Ride> _rides = [
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now(),
      arrivalLocation: Location(name: 'Siemreap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
      driver: fakeUsers.first,
      availableSeats: 1,
      pricePerSeat: 1,
      filter: RidesFilter(),
    )..passengers.add(User(
        firstName: 'Kannika',
        lastName: '',
        email: "Kannika@gmail.com",
        phone: "078785339",
        profilePicture: 'profilePicture',
        verifiedProfile: true)),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now(),
      arrivalLocation: Location(name: 'Siemreap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
      driver: fakeUsers.first,
      availableSeats: 1,
      pricePerSeat: 1,
      filter: RidesFilter(),
    )..passengers.add(User(
        firstName: 'Chaylim',
        lastName: '',
        email: "Chaylim@gmail.com",
        phone: "078785339",
        profilePicture: 'profilePicture',
        verifiedProfile: true)),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now(),
      arrivalLocation: Location(name: 'Siemreap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
      driver: fakeUsers.first,
      availableSeats: 1,
      pricePerSeat: 1,
      filter: RidesFilter(),
    )..passengers.add(User(
        firstName: 'Mengtech',
        lastName: '',
        email: "Mengtech@gmail.com",
        phone: "078785339",
        profilePicture: 'profilePicture',
        verifiedProfile: true)),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now(),
      arrivalLocation: Location(name: 'Siemreap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
      driver: fakeUsers.first,
      availableSeats: 1,
      pricePerSeat: 1,
      filter: RidesFilter(acceptPet: true),
    )..passengers.add(User(
        firstName: 'Limhao',
        lastName: '',
        email: "Limhao@gmail.com",
        phone: "078785339",
        profilePicture: 'profilePicture',
        verifiedProfile: true)),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now(),
      arrivalLocation: Location(name: 'Siemreap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
      driver: fakeUsers.first,
      availableSeats: 1,
      pricePerSeat: 1,
      filter: RidesFilter(),
    )..passengers.add(User(
        firstName: 'Sovanda',
        lastName: '',
        email: "Sovanda@gmail.com",
        phone: "078785339",
        profilePicture: 'profilePicture',
        verifiedProfile: true)),
  ];

  @override
  void addRide(Ride ride) {
    _rides.add(ride);
  }

  @override
  List<Ride> getRide(RidePreference ridepref, RidesFilter filter) {
    return _rides;
  }
}
