import 'package:flutter/material.dart';

class BlaSwapLocationButton extends StatelessWidget {
  const BlaSwapLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Positioned(
        top: 15,
        right: 15,
        child: Icon(Icons.swap_vert),
      ),
    );
  }
}
