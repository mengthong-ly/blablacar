import 'package:flutter/material.dart';

class BlaSwapLocationButton extends StatelessWidget {
  const BlaSwapLocationButton({
    super.key,
    required this.callback,
  });

  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Icon(Icons.swap_vert),
    );
  }
}
