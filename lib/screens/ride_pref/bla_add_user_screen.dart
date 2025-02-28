import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class BlaAddUserScreen extends StatelessWidget {
  BlaAddUserScreen({
    super.key,
    required this.maximum,
    required this.minimum,
  }) {
    // Initialize passengerCount to minimum instead of 0
    passengerCount.value = minimum;

    // Set initial states correctly
    decreaseButtonActive.value = passengerCount.value > minimum;
    increaseButtonActive.value = passengerCount.value < maximum;
  }

  final int maximum;
  final int minimum;

  final ValueNotifier<int> passengerCount = ValueNotifier(1);
  final ValueNotifier<bool> decreaseButtonActive = ValueNotifier(false);
  final ValueNotifier<bool> increaseButtonActive = ValueNotifier(true);

  static Future<int> onNavigateToAddUser({
    required BuildContext context,
    required int minimun,
    required int maximun,
  }) async {
    return await Navigator.of(context)
        .push(AnimationUtils.createBottomToTopRoute(BlaAddUserScreen(
      minimum: minimun,
      maximum: maximun,
    )));
  }

  void increaseCount() {
    if (passengerCount.value < maximum) {
      passengerCount.value++;

      // Update button states
      decreaseButtonActive.value = passengerCount.value > minimum;
      increaseButtonActive.value = passengerCount.value < maximum;
    }
  }

  void decreaseCount() {
    if (passengerCount.value > minimum) {
      passengerCount.value--;

      // Update button states
      decreaseButtonActive.value = passengerCount.value > minimum;
      increaseButtonActive.value = passengerCount.value < maximum;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop<int>(passengerCount.value);
          },
          child: Icon(
            Icons.navigate_before,
            size: 32,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Number of seats to book',
                style: BlaTextStyles.heading.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: decreaseCount,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: decreaseButtonActive,
                      builder: (context, isActive, child) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isActive
                                  ? BlaColors.primary
                                  : BlaColors.disabled,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(6),
                          child: Icon(FontAwesomeIcons.minus,
                              color: isActive
                                  ? BlaColors.primary
                                  : BlaColors.disabled)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ValueListenableBuilder<int>(
                    valueListenable: passengerCount,
                    builder: (context, value, child) => Text(
                      value
                          .toString(), // Fixed: using `value`, not `passengerCount.value`
                      style: BlaTextStyles.heading.copyWith(
                        fontSize: 72,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: increaseCount,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: increaseButtonActive,
                      builder: (context, isActive, child) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isActive
                                ? BlaColors.primary
                                : BlaColors.disabled,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color:
                              isActive ? BlaColors.primary : BlaColors.disabled,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: BlaButton(
                isPrimary: false,
                iconData: null,
                label: 'Confirm',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
