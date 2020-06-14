import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:tedii/stores/daily_report_store.dart';

import '../routes.dart';

// ignore: must_be_immutable
class DailyReportOverview extends StatefulWidget {
  @override
  _DailyReportOverviewState createState() => _DailyReportOverviewState();
}

class _DailyReportOverviewState extends State<DailyReportOverview> {
  DailyReportStore dailyReportStore;

  @override
  void initState() {
    super.initState();
  }

  void changeDay(int change) {
    dailyReportStore.saveDailyReport(dailyReportStore.currentDailyReport);
    dailyReportStore.currentDailyReport = dailyReportStore.getDailyReport(
        dailyReportStore.currentDailyReport.date.add(Duration(days: change)));
//    dailyReportStore.saveDailyReport(dailyReportStore.currentDailyReport);
  }

  @override
  Widget build(BuildContext context) {
    dailyReportStore = Provider.of<DailyReportStore>(context);

    // Ouverture de l'application on set le currentDailyreport au jour actuel
    if (dailyReportStore.currentDailyReport == null) {
      dailyReportStore.currentDailyReport =
          dailyReportStore.getDailyReport(DateTime.now());
//      dailyReportStore.saveDailyReport(dailyReportStore.currentDailyReport);
    }

//    print(dailyReportStore.currentDailyReport);

    return Observer(builder: (context) {
      return Column(
          // Daily report
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              /// Naviguation DailyReport
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  tooltip: "Jour précédent",
                  onPressed: () {
                    this.changeDay(-1);
                  },
                ), // Jour précédent
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                      child: Row(

                        /// Jour courant
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            SizedBox(
                              width: 10,
                            ),
                            Text(dailyReportStore.currentDailyReport
                                .getShortDate())
                          ])),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  tooltip: "Jour suivant",
                  onPressed: () {
                    this.changeDay(1);
                  },
                ), // Jour suivant
              ],
            ),
            GestureDetector(
              onTap: () async {
                // Goto AddOrModifyDailyReport
                await Navigator.of(context).pushNamed<dynamic>(
                    Routes.addOrModifyDailyReport,
                    arguments: dailyReportStore.currentDailyReport);
              },
              child: Container(
                color: Colors.white,
                // Permet que toute la largeur soit cliquable
                height: 50,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(Icons.restaurant),
                    SizedBox(width: 10),
                    Text("Mes repas")
                  ],
                ),
              ),
            ),
            GestureDetector(

              /// My objectives
              onTap: () {
                // Todo goto MyObjectives
              },
              child: Container(
                color: Colors.white,
                // Permet que toute la largeur soit cliquable
                height: 50,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(RpgAwesome.archery_target),
                    SizedBox(width: 10),
                    Text("Mes objectifs")
                  ],
                ),
              ),
            ),
            GestureDetector(

              /// My events
              onTap: () {
                // Todo goto MyEvents
              },
              child: Container(
                color: Colors.white,
                // Permet que toute la largeur soit cliquable
                height: 50,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(Icons.event),
                    SizedBox(width: 10),
                    Text("Mes événements")
                  ],
                ),
              ),
            ),
          ]);
    });
  }
}
