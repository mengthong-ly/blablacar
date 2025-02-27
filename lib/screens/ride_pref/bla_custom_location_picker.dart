import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/bla_location_tile.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaCustomLocationPicker extends StatefulWidget {
  const BlaCustomLocationPicker({super.key});

  @override
  State<BlaCustomLocationPicker> createState() =>
      _BlaCustomLocationPickerState();
}

class _BlaCustomLocationPickerState extends State<BlaCustomLocationPicker> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String queryText = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
    
    Future.delayed(Duration.zero, () {
      focusNode.requestFocus();
    });
  }

  void onEmpty() {
    if (_controller.text.isEmpty) {
      focusNode.requestFocus();
    }
  }

  void onChange() {
    setState(() {
      queryText = _controller.text;
    });
  }

  List<Location> _onQueryLocation(List<Location> locations) {
    return queryText.isEmpty
        ? []
        : locations.where((loc) {
            return loc.country.name
                    .toLowerCase()
                    .contains(queryText.toLowerCase()) ||
                loc.name.toLowerCase().contains(queryText.toLowerCase());
          }).toList();
  }

  Widget buildLeading(void Function() callback) {
    return GestureDetector(
      onTap: () => callback(),
      child: Icon(Icons.navigate_before),
    );
  }

  Widget buildAction(void Function() callback) {
    return GestureDetector(
      onTap: () => callback(),
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: Icon(Icons.clear),
      ),
    );
  }

  Widget get body {
    List<Location> tempList = onShowResult() ?? [];
    return tempList.isEmpty
        ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: BlaSpacings.l, vertical: BlaSpacings.s),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.locationCrosshairs,
                  color: BlaColors.neutralLight,
                ),
                SizedBox(
                  width: BlaSpacings.m,
                ),
                Text('Use Current Location'),
                Spacer(),
                Icon(Icons.navigate_next)
              ],
            ),
          )
        : ListView.builder(
            itemCount: tempList.length,
            itemBuilder: (context, index) {
              return BlaLocationTile(
                location: tempList[index],
                callback: onSelectLocation,
              );
            },
          );
  }

  List<Location>? onShowResult() {
    return _onQueryLocation(fakeLocations);
  }

  void onSelectLocation(Location selectedLocation) {
    Navigator.of(context).pop<Location>(selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        // leadingWidth: widget.delegate.leadingWidth,
        // automaticallyImplyLeading:
        // widget.delegate.automaticallyImplyLeading ?? true,
        leading: buildLeading(Navigator.of(context).pop),
        title: TextField(
          controller: _controller,
          focusNode: focusNode,
          style: TextStyle(),
          textInputAction: TextInputAction.search,
          autocorrect: true,
          enableSuggestions: true,
          keyboardType: TextInputType.text,
          onSubmitted: (String value) => onShowResult(),
          decoration: InputDecoration(
            hintText: 'station road or the bridge cafe',
            border: InputBorder.none,
          ),
        ),
        flexibleSpace: null, // i don't want to show anything here
        actions: [buildAction(_controller.clear)],
        bottom: null, // nothing to show either
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: body,
      ),
    );
  }
}
