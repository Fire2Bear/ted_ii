import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedii/stores/daily_report_store.dart';
import 'package:tedii/tabs/daily_report_overview.dart';

import 'components/common/logo.dart';
import 'components/common/my_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DailyReportStore dailyReportStore;

  // _index définit l'onglet sur lequel l'utilisateur se trouve
  int _index;

  @override
  void initState() {
    super.initState();

    _index = 1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
            child = Scaffold(
              appBar: AppBar(
                title: Logo(),
              ),
              body: IndexedStack(
                index: _index,
                children: <Widget>[
                  Container(
                    color: Colors.orange,
                  ),
                  DailyReportOverview(),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.show_chart),
                    title: Text('STATISTIQUE'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_view_day),
                    title: Text('ACTIVITE'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.receipt),
                      title: Text('RECETTE'),
                      backgroundColor: Colors.green)
                ],
                onTap: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                currentIndex: _index,
              ),
              drawer: MyDrawer(),
            );
          } else {
            print(snapshot);
            child = Row(
              children: <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 30,
                  height: 30,
                ),
                Text(
                  'Awaiting result...',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            );
          }
          return child;
        });
  }
}
