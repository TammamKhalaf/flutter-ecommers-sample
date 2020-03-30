import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDownList extends StatefulWidget {
  final List<String> subTitles;

  const DropDownList(this.subTitles) : super();

  @override
  State<StatefulWidget> createState() => DropDownState(subTitles);
}

class DropDownState extends State<DropDownList> {
  final List<String> subTitles;
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedSubTitle;

  DropDownState(this.subTitles);

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(subTitles);
    _selectedSubTitle = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(
      List<String> subTitles) {
    final List<DropdownMenuItem<String>> items = [];
    for (String subTitle in subTitles) {
      items.add(
        DropdownMenuItem(
          child: Text(
            subTitle,
          ),
        ),
      );
    }
    return items;
  }

  void onChangeDropdownItem(String selectedSubTitle) {
    setState(() {
      _selectedSubTitle = selectedSubTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedSubTitle,
      items: _dropdownMenuItems,
      onChanged: onChangeDropdownItem,
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: Colors.transparent.withOpacity(0.3),
          ),
      isDense: false,
    );
  }
}
