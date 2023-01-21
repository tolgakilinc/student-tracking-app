import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class GaugesAYT extends StatefulWidget {
  double aytOrt;

  GaugesAYT({Key key, this.aytOrt}) : super(key: key);

  @override
  State<GaugesAYT> createState() => _GaugesAYTState();
}

class _GaugesAYTState extends State<GaugesAYT> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(

        child: SfRadialGauge(
            enableLoadingAnimation: true, animationDuration: 5000,
            axes: <RadialAxis>[
              RadialAxis(minimum: 0,maximum: 80,
                  ranges: <GaugeRange>[
                    GaugeRange(startValue: 0,endValue: 50,color: Colors.green,startWidth: 10,endWidth: 10),
                    GaugeRange(startValue: 50,endValue: 70,color: Colors.orange,startWidth: 10,endWidth: 10),
                    GaugeRange(startValue: 70,endValue: 80,color: Colors.red,startWidth: 10,endWidth: 10)],
                  pointers: <GaugePointer>[NeedlePointer(value: widget.aytOrt, )],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(widget: Container(child:
                    Text('AYT: ${widget.aytOrt.ceil()}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold))),
                        angle: 90,positionFactor: 0.5)],

              )]
        ),
      ),
    );
  }
}