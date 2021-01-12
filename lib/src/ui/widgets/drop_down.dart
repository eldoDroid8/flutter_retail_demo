import 'package:flutter/material.dart';

abstract class DropdownWidgetState<Page extends StatefulWidget, T>
    extends State<Page> {
  List<DropdownMenuItem<T>> dropdownMenuItems;
  T selectedItem;
  List<DropdownMenuItem<T>> buildDropDownMenuItems();
  final Function(T) onDropDownSelected;

  DropdownWidgetState(this.onDropDownSelected);

  void initState() {
    super.initState();
    dropdownMenuItems = buildDropDownMenuItems();
    selectedItem = dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
        value: selectedItem,
        items: dropdownMenuItems,
        onChanged: (value) {
          setState(() {
            onDropDownSelected(value);
            selectedItem = value;
          });
        });
  }
}

class WidgetItem<U> {
  final int index;
  final U item;

  WidgetItem(this.index, this.item);
}
