import 'package:flutter/material.dart';

import '../../../constans.dart';

class LessonItem extends StatelessWidget {
  final String lessonName;
  final String subject;
  const LessonItem({Key key, this.lessonName, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.5,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: kLicoriceColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffe2e2e2)),
      ),
      child: Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                lessonName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              SizedBox(
                height: 5,
              ),
             /* Row(
                children: [
                  Icon(Icons.?),
                  Text(
                    subject,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),*/

            ],
          ),
        ),
      ),
    );
  }
}
