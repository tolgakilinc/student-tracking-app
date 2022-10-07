import 'package:flutter/material.dart';

import '../constans.dart';

class IconButtons extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final VoidCallback press;
  const IconButtons({Key key, this.nameLabel, this.iconLabel, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.13,
      width: size.width * 0.15,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                onTap:press,
                child: Container(
                   margin: EdgeInsets.all(5),

                  height: size.height * 0.06,
                  width: size.width * 0.11,
                  decoration: BoxDecoration(
                    color: kLicoriceColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600,),
            ),
          )
        ],
      ),
    );
  }
}