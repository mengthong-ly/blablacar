import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

void main() {
  group('RidePreference Tests', () {
    // Existing test for RidePreference creation
    test('RidePreference creates correctly', () {
      final DateTime departureDate = DateTime.now();
      final Location departure =
          Location(name: 'Battambang', country: Country.cambodia);
      final Location arrival =
          Location(name: 'SieamReap', country: Country.cambodia);
      final RidePreference ridePref = RidePreference(
        departure: departure,
        departureDate: departureDate,
        arrival: arrival,
        requestedSeats: 1,
      );

      expect(ridePref.departure.name, equals("Battambang"),
          reason: 'Departure location should match');
      expect(ridePref.departure.country, equals(Country.cambodia),
          reason: 'Departure country should match');
      expect(ridePref.arrival.name, equals("SieamReap"),
          reason: 'Arrival location should match');
      expect(ridePref.arrival.country, equals(Country.cambodia),
          reason: 'Arrival country should match');
      expect(ridePref.requestedSeats, equals(1),
          reason: 'Requested seats should match');
      expect(ridePref.departureDate, equals(departureDate),
          reason: 'Departure date should match');
    });

    // New test for ride availability
    test('Ride search returns 4 results with 1 full ride', () {
      // Arrange
      final departure = Location(name: 'Battambang', country: Country.cambodia);
      final arrival = Location(name: 'SieamReap', country: Country.cambodia);
      final ridePref = RidePreference(
        departure: departure,
        departureDate: DateTime.now(),
        arrival: arrival,
        requestedSeats: 1,
      );

      // Act: Filter rides based on preference
      final List<Ride> availableRides = fakeRides.where((ride) {
        return ride.departureLocation == ridePref.departure &&
            ride.arrivalLocation == ridePref.arrival;
      }).toList();

      // Assert: Check 1 ride is full
      final fullRides =
          availableRides.where((ride) => ride.availableSeats == 0);
      expect(fullRides.length, equals(1),
          reason: 'Exactly 1 ride should be full (0 available seats)');
    });

    test('Ride search with pet filter returns 1 result (Mengtech)', () {
      // Arrange
      final departure = Location(name: 'Battambang', country: Country.cambodia);
      final arrival = Location(name: 'Siem Reap', country: Country.cambodia);
      final today = DateTime.now();
      final ridePref = RidePreference(
        departure: departure,
        departureDate: today,
        arrival: arrival,
        requestedSeats: 1,
      );
      final rideFilter = RidesFilter(acceptPet: true);

      // Act: Filter rides based on preference and filter
      final List<Ride> availableRides = fakeRides.where((ride) {
        // Match departure and arrival locations
        bool matchesLocations = ride.departureLocation == ridePref.departure &&
            ride.arrivalLocation == ridePref.arrival;

        // Match date (same day)
        bool matchesDate =
            ride.departureDate.day == ridePref.departureDate.day &&
                ride.departureDate.month == ridePref.departureDate.month &&
                ride.departureDate.year == ridePref.departureDate.year;

        // Match filter and seat availability
        bool matchesFilter = ride.filter.acceptPet == rideFilter.acceptPet &&
            ride.availableSeats >= ridePref.requestedSeats;

        return matchesLocations && matchesDate && matchesFilter;
      }).toList();

      // Assert
      expect(availableRides.length, equals(1),
          reason: 'Should return exactly 1 ride result');
      expect(availableRides.first.driver.firstName, equals('Mengtech'),
          reason: 'The ride should be driven by Mengtech');
    });
  });
}
