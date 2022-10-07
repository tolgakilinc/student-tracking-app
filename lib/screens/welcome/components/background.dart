import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: -40,
            child: Image(
              image: AssetImage("assets/images/blue_ball.jpg",),

              width: size.width * 0.2,
            ),
          ),
          Positioned(bottom: -200, left: 100, child: Image( image: AssetImage("assets/images/blue_ball.jpg",),

            )
          ),

        ],
      ),
    );
  }
}
