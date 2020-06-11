import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedii/stores/daily_report_store.dart';
import 'package:tedii/tabs/daily_report_overview.dart';

// ignore: must_be_immutable
class ActivityOverview extends StatefulWidget {
  @override
  _ActivityOverviewState createState() => _ActivityOverviewState();
}

class _ActivityOverviewState extends State<ActivityOverview> {
  DailyReportStore dailyReportStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dailyReportStore = Provider.of<DailyReportStore>(context);

    Future<void> dailyReports = dailyReportStore.loadDailyReports();

    return FutureBuilder<void>(
        future: dailyReports,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget child;
          if (snapshot.connectionState == ConnectionState.done) {
            // Si la récupération des données est terminée on affiche la vue normale
            child = Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    child: DailyReportOverview(),
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
//                      alignment: Alignment.topCenter,
                  )
                ],
              ),
            );
          } else {
            // Si les données sont en cours de chargement on affiche un loading screen
            child = Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Chargement des données...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
//              alignment: Alignment.topCenter,
              ),
            );
          }
          return child;
        });
  }
}
