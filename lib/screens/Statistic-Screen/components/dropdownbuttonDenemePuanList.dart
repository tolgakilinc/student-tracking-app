import 'package:developer_student/Models/DenemeBase.dart';
import 'package:flutter/material.dart';

class DropdownStatistic2 extends StatefulWidget {
  // Initial Selected Value

  DropdownStatistic2({Key key}) : super(key: key);

  @override
  _DropdownStatistic2State createState() => _DropdownStatistic2State();
}

class _DropdownStatistic2State extends State<DropdownStatistic2> {
  String dropdownvalue = 'Son 10';

  var items = [
    'Son 10',
    'İlk 10',
    'Tüm Denemeler',
    'Son 30 deneme',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(

        child:    DropdownButton(

          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              dropdownvalue = newValue;
            });
          },
        ),

    );
    }
    }
