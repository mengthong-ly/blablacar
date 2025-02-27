import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';

class BlaLocationTile extends StatelessWidget {
  const BlaLocationTile(
      {super.key, required this.location, required this.callback});

  final Location location;
  final void Function(Location) callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(location),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: BlaSpacings.s,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: BlaSpacings.l,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: BlaTextStyles.body,
                    ),
                    Text(
                      location.country.name,
                      style: BlaTextStyles.body
                          .copyWith(color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.navigate_next_rounded),
                SizedBox(
                  width: BlaSpacings.m,
                )
              ],
            ),
            SizedBox(
              height: BlaSpacings.s,
            ),
            BlaDivider()
          ],
        ),
      ),
    );
  }
}
