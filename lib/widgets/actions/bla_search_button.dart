import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaSearchButton extends StatelessWidget {
  const BlaSearchButton({super.key, required this.ontTap});

  final void Function() ontTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontTap(),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: BlaColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.symmetric()
        ),
        child: Center(
          child: Text(
              'Search',
              style: BlaTextStyles.body.copyWith(color: BlaColors.white),
            ),
        ),
      ),
    );
  }
}
