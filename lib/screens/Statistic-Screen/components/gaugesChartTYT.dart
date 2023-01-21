import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class GaugesTYT extends StatefulWidget {
  double tytOrt;

  GaugesTYT({Key key, this.tytOrt}) : super(key: key);

  @override
  State<GaugesTYT> createState() => _GaugesTYTState();
}

class _GaugesTYTState extends State<GaugesTYT> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),

      child: Column(
        children: [
          FutureBuilder(
            future: GetAllDeneme(),
              builder: (context, AsyncSnapshot<DenemeBase> snapshot){
                if(!snapshot.hasData) return Center(child:CircularProgressIndicator());
                List<Deneme> denemeList = snapshot.data.data;
                return SfRadialGauge(
                    enableLoadingAnimation: true, animationDuration: 5000,
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0,maximum: 120,
                          ranges: <GaugeRange>[
                            GaugeRange(startValue: 0,endValue: 50,color: Colors.green,startWidth: 10,endWidth: 10),
                            GaugeRange(startValue: 50,endValue: 100,color: Colors.orange,startWidth: 10,endWidth: 10),
                            GaugeRange(startValue: 100,endValue: 120,color: Colors.red,startWidth: 10,endWidth: 10)],
                          pointers: <GaugePointer>[NeedlePointer(value:widget.tytOrt)],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(widget: Container(child:
                            Text('TYT: ${widget.tytOrt.ceil()}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold))),
                                angle: 90,positionFactor: 0.5)]
                      )]
                );
              }
          ),
        ],
      )
    );

  }

}


