import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:tedii/models/daily_report_model.dart';
import 'package:tedii/stores/daily_report_store.dart';

import '../routes.dart';

// ignore: must_be_immutable
class DailyReportOverview extends StatefulWidget {
  @override
  _DailyReportOverviewState createState() => _DailyReportOverviewState();
}

class _DailyReportOverviewState extends State<DailyReportOverview> {
  DailyReportStore dailyReportStore;

  DailyReport currentDailyReport;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dailyReportStore = Provider.of<DailyReportStore>(context);

    if (this.currentDailyReport == null) {
      this.currentDailyReport = dailyReportStore.getDailyReport(DateTime.now());
      dailyReportStore.saveDailyReport(currentDailyReport);
    }

    print(this.currentDailyReport);

    return Observer(builder: (context) {
      return Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Column(
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
                            // TODO Call changeDay(-1)
                          },
                        ), // Jour précédent
                        GestureDetector(
                          onTap: () async {
                            /*
                            DailyReportOverview dailyReport = await Navigator.of(context).pushNamed<dynamic>(
                                Routes.addOrModifyDailyReport,
                                arguments: DailyReport(date: DateTime.now()));
                                */
                          },
                          child: Container(
                              child: Row(

                                /// Jour courant
                                  children: <Widget>[
                                    Icon(Icons.calendar_today),
                                    Text("Aujourd'hui, 23 Avril"),
                                  ])),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          tooltip: "Jour suivant",
                          onPressed: () {
                            // TODO Call changeDay(1)
                          },
                        ), // Jour suivant
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        // Goto AddOrModifyDailyReport
                        await Navigator.of(context).pushNamed<dynamic>(
                            Routes.addOrModifyDailyReport,
                            arguments: this.currentDailyReport);
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
                        // Todo goto MyEvents
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
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              // Largeur de la naviguation
              height: MediaQuery.of(context).size.height / 3,
              // Hauteur de la naviguation
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(-1.5, 1.5),
                    blurRadius: 5.0,
                  )
                ],
              ),
              alignment: Alignment.topCenter,
            )
          ],
        ),
      );
    });
  }
}
