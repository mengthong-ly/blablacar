import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaFormInput extends StatelessWidget {
  const BlaFormInput({
    super.key,
    required this.iconData,
    required this.label,
  });

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: BlaSpacings.m, horizontal: BlaSpacings.s),
      decoration: BoxDecoration(),
      child: Row(
        children: [
          SizedBox(width: BlaSpacings.m),
          Icon(iconData, size: 18),
          SizedBox(
            width: BlaSpacings.m,
          ),
          Text(label, style: BlaTextStyles.body),
        ],
      ),
    );
  }
}
