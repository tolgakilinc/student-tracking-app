import 'package:flutter/material.dart';
class DropdownStatistic extends StatefulWidget {
  // Initial Selected Value

   DropdownStatistic({Key key}) : super(key: key);

  @override
  _DropdownStatisticState createState() => _DropdownStatisticState();
}

class _DropdownStatisticState extends State<DropdownStatistic> {
  String dropdownvalue = 'Deneme 1';

  var items = [
    'Deneme 1',
    'Deneme 2',
    'Deneme 3',
    'Deneme 4',
    'Deneme 5',
  ];

  @override
  Widget build(BuildContext context) {

    return Container(

      child: DropdownButton(

        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String newValue){
          setState(() {
            dropdownvalue = newValue;
          });
        },
      ),
    );
  }
}
