import 'dart:async';

import 'package:app_usage/app_usage.dart';
import 'package:developer_student/main.dart';
import 'package:flutter/material.dart';
import 'package:developer_student/screens/Study-Program/components/pages/study_program_add.dart';
import '../../../constans.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


/*class UsageStatistics extends StatefulWidget {

  @override
  _UsageStatisticsState createState() => _UsageStatisticsState();
}

class _UsageStatisticsState extends State<UsageStatistics> {

  String _minuteString = '';
  String _secondString = '';
  String _hourString = '';
  // Zaman tutucu değişkeni
  Stopwatch stopwatch;

  // Günlük kullanım sürelerini tutacak bir liste
  List<double> dailyUsage;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
       _minuteString = '${stopwatch.elapsed.inMinutes}';
       _secondString = '${stopwatch.elapsed.inSeconds}';
       _hourString = '${stopwatch.elapsed.inHours}';
      });
    });
    // Zaman tutucuyu oluşturun ve sıfırlayın
    stopwatch = Stopwatch();
    stopwatch.start();

    // Günlük kullanım sürelerini tutacak listeyi oluşturun
    dailyUsage = List<double>();
  }

  @override
  void dispose() {
    super.dispose();

    // Zaman tutucuyu durdurun
    stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    AppUsageTracker tracker = AppUsageTracker();
    tracker.addDailyUsage();
    // Günlük kullanım süresini hesaplamak için zaman tutucudaki süreyi dakika cinsinden alın
    double usage = stopwatch.elapsedMilliseconds / (1000 * 60);


    // Günlük kullanım süresini günlük kullanım süreleri listesine ekleyin
    dailyUsage.add(usage);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kEerieBlackColor,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(30),
            title: Text("Veli Bilgilendirme",
              style: TextStyle(fontSize: 18, color: Colors.white,),),
            centerTitle: false,
            background: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/parentControl.png"),
                      fit: BoxFit.contain
                  )
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  children:[
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Pazartesi:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Salı:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Çarşamba:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Perşembe:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Cuma:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Cumartesi:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      color: Colors.greenAccent,
                      child: ListTile(
                        dense: false,

                        minVerticalPadding: 15,
                        autofocus: true,

                        onTap: (){
                          print("tıklandı");
                        },
                        title: Text("Anlık giriş: ${tracker.dailyUsage.entries.last.key}",),
                        trailing: Text('Haftalık kullanılan : ${stopwatch.elapsed.inDays} gün'),
                        subtitle: Text("Pazar:${_minuteString} dakika kullanıldı. Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.green[900]),),
                        //subtitle: Text("Kullanılan Dakika :${stopwatch.elapsed.inSeconds} Kullanılan Saat: ${_hourString} Kullanılan Saniye: ${_secondString}",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                  ]
                );
              },
              childCount: 1,
            )),

      ],
    );

  }
}*/

////////////////////////////////////////////////////

/*class UsageStatistics extends StatefulWidget {
  @override
  _UsageStatisticsState createState() => _UsageStatisticsState();
}

class _UsageStatisticsState extends State<UsageStatistics> {
  // Zaman tutucu değişkeni
  Stopwatch stopwatch;

  // Günlük kullanım sürelerini tutacak bir liste
  List<charts.Series<TimeSeriesUsage, DateTime>> usageData;

  @override
  void initState() {
    super.initState();

    // Zaman tutucuyu oluşturun ve sıfırlayın
    stopwatch = Stopwatch();
    stopwatch.start();

    // Günlük kullanım sürelerini tutacak listeyi oluşturun
    usageData = List<charts.Series<TimeSeriesUsage, DateTime>>();
  }

  @override
  void dispose() {
    super.dispose();

    // Zaman tutucuyu durdurun
    stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    // Günlük kullanım süresini hesaplamak için zaman tutucudaki süreyi milisaniye cinsinden alın
    double dailyUsage = stopwatch.elapsedMilliseconds / (1000 * 60 * 60);

    // Günlük kullanım süresini günlük kullanım süreleri listesine ekleyin
    usageData.add(charts.Series(
      id: 'Usage',
      data: [
        TimeSeriesUsage(DateTime.now(), dailyUsage),
      ],
      domainFn: (TimeSeriesUsage usage, _) => usage.time,
      measureFn: (TimeSeriesUsage usage, _) => usage.usage,
    ));

    // Grafiği oluşturun
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Weekly usage'),
              Expanded(
                child: charts.TimeSeriesChart(
                  usageData,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Günlük kullanım sürelerini tutacak sınıf
class TimeSeriesUsage {
  final DateTime time;
  final double usage;

  TimeSeriesUsage(this.time, this.usage);
}*/






///////////////////////

/*class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _secondsSpent = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsSpent++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Spent in App'),
      ),
      body: Center(
        child: Text(
          'You have spent $_secondsSpent seconds in this app.',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}*/

///////////////////////////
class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<AppUsageInfo> _infos = [];

  @override
  void initState() {
    super.initState();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(hours: 1));
      List<AppUsageInfo> infoList = await AppUsage.getAppUsage(
          startDate, endDate);
      setState(() {
        _infos = infoList;
      });

      for (var info in infoList) {
        print(info.toString());
      }
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Uygulama geçmişi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kEerieBlackColor,
      ),
      body: ListView.builder(
          itemCount: _infos.length,
          itemBuilder: (context, index) {
        return ListTile(
          minVerticalPadding: 20,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.redAccent,
            ),

            width: 140,
              height: 50,
              child: Card(
                  color: Colors.redAccent,
                  child: Center(child: Text(_infos[index].appName)))),
          trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
            width: 100,
              height: 50,
              child: Card(
                  color: Colors.greenAccent,
                  child: Center(child: Text(_infos[index].usage.inMinutes.toString())))),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: getUsageStats, child: Icon(Icons.file_download),
      ),
    );
  }
}

/////////////////////////////////////////////

/*class DailyUsagePage extends StatefulWidget {
  final String appPackage;
  DailyUsagePage({Key key, this.appPackage}) : super(key: key);

  @override
  _DailyUsagePageState createState() => _DailyUsagePageState();
}

class _DailyUsagePageState extends State<DailyUsagePage> {
  int _hours = 0;
  int _minutes = 0;

  void getUsage() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 1));
      AppUsageInfo info = (await AppUsage.getAppUsage(startDate, endDate))[0];
      int duration = info.usage.inSeconds;
      setState(() {
        _hours = duration ~/ Duration.millisecondsPerHour;
        _minutes = (duration - (_hours * Duration.millisecondsPerHour)) ~/ Duration.millisecondsPerMinute;
      });
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Usage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Total usage for the last 24 hours:"),
            SizedBox(height: 20),
            Text("$_hours hours, $_minutes minutes", style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getUsage,
        child: Icon(Icons.refresh),
      ),
    );
  }
}*/
