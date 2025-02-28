import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week_3_blabla_project/screens/ride_pref/bla_add_user_screen.dart';
import 'package:week_3_blabla_project/screens/ride_pref/bla_custom_location_picker.dart';
import 'package:week_3_blabla_project/screens/ride_pref/ride_screen.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/bla_swap_location_button.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_search_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/bla_form_input.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onSelectLeavingFromLocation() async {
    // showSearch(context: context, delegate: BlaLocationSearchDelegate());
    departure = await Navigator.of(context).push<Location>(
        AnimationUtils.createBottomToTopRoute(BlaCustomLocationPicker()));
    setState(() {});
  }

  void onSelectGoingToLocation() async {
    // showSearch(context: context, delegate: BlaLocationSearchDelegate());
    arrival = await Navigator.of(context).push<Location>(
        AnimationUtils.createBottomToTopRoute(BlaCustomLocationPicker()));
    setState(() {});
  }

  void onSearch() async {
    // Validate the form and create a RidePref object
    // AnimationUtils.createBottomToTopRoute(RideScreen());
    await Navigator.of(context)
        .push<RidePref>(AnimationUtils.createBottomToTopRoute(RideScreen()));
    // if (_formKey.currentState!.validate()) {
    //   RidePref ridePref = RidePref(
    //     departure: departureLocation!,
    //     arrival: arrivalLocation!,
    //     departureDate: departureDate,
    //     requestedSeats: requestedSeats,
    //   );
    //   // await Navigator.of(context).push();
    // } else {

    // }
  }

  void onSwitch() {
    setState(() {
      var temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaFormInput(
                iconData: FontAwesomeIcons.circle,
                label: Location(
                        name: departure?.name ?? 'Leaving From',
                        country: Country.france)
                    .name,
                callback: onSelectLeavingFromLocation,
                action: BlaSwapLocationButton(
                  callback: onSwitch,
                ),
              ),
              BlaDivider(),
              BlaFormInput(
                iconData: FontAwesomeIcons.circle,
                label: Location(
                        name: arrival?.name ?? 'Going to',
                        country: Country.france)
                    .name,
                callback: onSelectGoingToLocation,
              ),
              BlaDivider(),
              BlaFormInput(
                iconData: FontAwesomeIcons.solidCalendarDays,
                label: '12-30-2025',
                callback: () {},
              ),
              BlaDivider(),
              // BlaPassengerSelector(),
              BlaFormInput(
                  iconData: FontAwesomeIcons.user,
                  label: '1',
                  callback: () async {
                    int count = await BlaAddUserScreen.onNavigateToAddUser(
                        context: context, minimun: 1, maximun: 8);
                    print(count);
                  }),
              BlaSearchButton(
                ontTap: onSearch,
              )
            ],
          ),
        ],
      ),
    );
  }
}
