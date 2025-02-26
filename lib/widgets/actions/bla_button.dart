import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaButton extends StatelessWidget {
  const BlaButton({
    super.key,
    required this.isPrimary,
    required this.label,
    required this.iconData,
  });

  final bool isPrimary;
  final String label;
  final IconData iconData;

  Color get iconColor => isPrimary ? BlaColors.primary : BlaColors.white;
  Color get buttonColor => isPrimary ? BlaColors.white : BlaColors.primary;

  TextStyle get textStyle => isPrimary ? TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: BlaColors.primary,
  ) : TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: BlaColors.white
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(iconColor),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          ),
      onPressed: () {},
      label: Text(label,style: textStyle),
      icon: Icon(iconData),
    );
  }
}
