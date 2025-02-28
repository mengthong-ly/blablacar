import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';

class RideScreen extends StatelessWidget {
  RideScreen({
    super.key,
  });

  final RidePref ridePref = RidePref(
      departure: Location(name: 'paris', country: Country.france),
      departureDate: DateTime.now(),
      arrival: Location(name: 'paris', country: Country.france),
      requestedSeats: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        titleSpacing: 25,
        leading: SizedBox.shrink(),
        actions: [],
        title: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(width: 0.7, color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: BlaSpacings.s,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop<RidePref>(),
                  child: Icon(Icons.navigate_before,
                      size: 24, color: Colors.black)),
              SizedBox(
                width: BlaSpacings.s,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(ridePref.departure.name, style: BlaTextStyles.body),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 16,
                      ),
                      Text(ridePref.arrival.name, style: BlaTextStyles.body),
                    ],
                  ),
                  Text(
                      '${DateTimeUtils.formatDateTime(ridePref.departureDate)}, ${ridePref.requestedSeats} ${ridePref.departure}',
                      style: BlaTextStyles.label
                          .copyWith(color: BlaColors.neutralLight))
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: BlaColors.neutralDark),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          '11:40',
                          style: BlaTextStyles.label.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '0h40',
                          style: BlaTextStyles.label.copyWith(
                            color: BlaColors.greyLight,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '12:20',
                          style: BlaTextStyles.label.copyWith(
                              color: BlaColors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      width: BlaSpacings.s,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          height: 50,
                          width: 3.5,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Icon(
                              FontAwesomeIcons.circleDot,
                              color: Colors.white,
                              size: 13,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Icon(
                              FontAwesomeIcons.circleDot,
                              color: Colors.white,
                              size: 13,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: BlaSpacings.s,
                    ),
                    Column(
                      children: [
                        Text(
                          ridePref.arrival.name,
                          style: BlaTextStyles.label.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          ridePref.departure.name,
                          style: BlaTextStyles.label.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '\$50.00',
                      style: BlaTextStyles.heading.copyWith(
                          color: BlaColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BlaDivider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.carSide,
                      color: BlaColors.greyLight,
                      size: 18,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BlaColors.primary,
                                width: 2,
                              )),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 17,
                            backgroundImage:
                                AssetImage('assets/images/DSC02704.jpg'),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              FontAwesomeIcons.shieldHeart,
                              color: BlaColors.primary,
                              size: 16,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: BlaSpacings.s,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mohamed Saeed',
                          style: BlaTextStyles.label.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              '5',
                              style: BlaTextStyles.label.copyWith(
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
