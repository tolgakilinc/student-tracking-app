import 'package:flutter/material.dart';

import '../../../constans.dart';

class MenuButton extends StatefulWidget {
  final String nameLabel;
  final IconData iconLabel;
  final VoidCallback press;
  final double height;
  final double width;
  const MenuButton({Key key, this.nameLabel, this.iconLabel, this.press, this.height, this.width}) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color _color = Colors.redAccent;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: widget.height,
            width: widget.width,

            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.transparent,
              child: InkWell(
                onHover: (bool hovering) {
                  setState(() {
                    if (hovering) {
                      _color = Colors.purple;
                    } else {
                      _color = Colors.greenAccent;
                    }
                  });
                },
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                onTap:widget.press,
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              widget.iconLabel,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                widget.nameLabel,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}