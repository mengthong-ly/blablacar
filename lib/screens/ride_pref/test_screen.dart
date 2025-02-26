import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaButton(
                isPrimary: true,
                label: 'Request to book',
                iconData: Icons.calendar_today_outlined,
              ),
              BlaButton(
                isPrimary: false,
                label: 'Request to book',
                iconData: Icons.chat_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}
