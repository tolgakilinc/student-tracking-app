import 'package:flutter/material.dart';

import '../constans.dart';

class IconButtonIP extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final bool notification;

  const IconButtonIP(
      {Key key, this.nameLabel, this.iconLabel, this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.transparent,
              child: InkWell(
                //tıklayınca tepki veren class
                borderRadius: BorderRadius.all(Radius.circular(15)),
                onTap: () {}, // DAHA SONRA EKLE!!!!!!!!!!!!!!!!!!!1
                child: Container(
                   //margin: EdgeInsets.all(5),
                  height: size.height * 0.06,
                  width:  size.width * 0.13,
                  //height: 45,
                  //width: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: kLicoriceColor,
                          size: 35,
                        ),
                        notification
                            ? Positioned(
                                top: 5,
                                left: 20,
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  constraints: BoxConstraints(
                                    minHeight: 10,
                                    minWidth: 10,
                                  ),
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            nameLabel,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
