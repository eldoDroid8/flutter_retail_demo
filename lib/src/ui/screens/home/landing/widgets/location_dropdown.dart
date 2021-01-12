import 'package:flutter/material.dart';
import 'package:retail_demo/src/ui/widgets/drop_down.dart';

class LocationDropdown extends StatefulWidget {
  final Function(WidgetItem) onDropDownSelected;

  LocationDropdown({@required this.onDropDownSelected});

  @override
  LocationDrownState createState() => LocationDrownState(onDropDownSelected);
}

class LocationDrownState<T>
    extends DropdownWidgetState<LocationDropdown, WidgetItem> {
  LocationDrownState(Function(WidgetItem) callback) : super(callback);

  @override
  List<DropdownMenuItem<WidgetItem>> buildDropDownMenuItems() {
    List<WidgetItem> dropdownItems = [
      WidgetItem(1, "Banglore"),
      WidgetItem(2, "kochi"),
      WidgetItem(3, "Calicut")
    ];

    List<DropdownMenuItem<WidgetItem>> items = List();
    for (WidgetItem listItem in dropdownItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.item),
          value: listItem,
        ),
      );
    }
    return items;
  }
}
